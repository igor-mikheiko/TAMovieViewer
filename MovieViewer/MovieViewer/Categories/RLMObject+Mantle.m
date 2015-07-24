//
//  RLMObject+Mantle.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "RLMObject+Mantle.h"
#import <objc/runtime.h>
#import "Mantle/EXTRuntimeExtensions.h"
#import "Mantle/EXTScope.h"
#import "Mantle/MTLReflection.h"

// Used to cache the reflection performed in +propertyKeys.
static void *RLMModelCachedPropertyKeysKey = &RLMModelCachedPropertyKeysKey;

// Associated in +generateAndCachePropertyKeys with a set of all transitory
// property keys.
static void *RLMModelCachedTransitoryPropertyKeysKey = &RLMModelCachedTransitoryPropertyKeysKey;

// Associated in +generateAndCachePropertyKeys with a set of all permanent
// property keys.
static void *RLMModelCachedPermanentPropertyKeysKey = &RLMModelCachedPermanentPropertyKeysKey;

// Validates a value for an object and sets it if necessary.
//
// obj         - The object for which the value is being validated. This value
//               must not be nil.
// key         - The name of one of `obj`s properties. This value must not be
//               nil.
// value       - The new value for the property identified by `key`.
// forceUpdate - If set to `YES`, the value is being updated even if validating
//               it did not change it.
// error       - If not NULL, this may be set to any error that occurs during
//               validation
//
// Returns YES if `value` could be validated and set, or NO if an error
// occurred.
static BOOL RLMValidateAndSetValue(id obj, NSString *key, id value, BOOL forceUpdate, NSError **error) {
    // Mark this as being autoreleased, because validateValue may return
    // a new object to be stored in this variable (and we don't want ARC to
    // double-free or leak the old or new values).
    __autoreleasing id validatedValue = value;

    @try {
        if (![obj validateValue:&validatedValue forKey:key error:error]) return NO;

        if (forceUpdate || value != validatedValue) {
            [obj setValue:validatedValue forKey:key];
        }

        return YES;
    } @catch (NSException *ex) {
        NSLog(@"*** Caught exception setting key \"%@\" : %@", key, ex);

        // Fail fast in Debug builds.
#if DEBUG
        @throw ex;
#else
        if (error != NULL) {
            *error = [NSError mtl_modelErrorWithException:ex];
        }
        
        return NO;
#endif
    }
}


@implementation RLMObject (Mantle)

+ (void)generateAndCacheStorageBehaviors {
    NSMutableSet *transitoryKeys = [NSMutableSet set];
    NSMutableSet *permanentKeys = [NSMutableSet set];

    for (NSString *propertyKey in self.propertyKeys) {
        switch ([self storageBehaviorForPropertyWithKey:propertyKey]) {
            case MTLPropertyStorageNone:
                break;

            case MTLPropertyStorageTransitory:
                [transitoryKeys addObject:propertyKey];
                break;

            case MTLPropertyStoragePermanent:
                [permanentKeys addObject:propertyKey];
                break;
        }
    }

    // It doesn't really matter if we replace another thread's work, since we do
    // it atomically and the result should be the same.
    objc_setAssociatedObject(self, RLMModelCachedTransitoryPropertyKeysKey, transitoryKeys, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, RLMModelCachedPermanentPropertyKeysKey, permanentKeys, OBJC_ASSOCIATION_COPY);
}

+ (MTLPropertyStorage)storageBehaviorForPropertyWithKey:(NSString *)propertyKey {
    objc_property_t property = class_getProperty(self.class, propertyKey.UTF8String);

    if (property == NULL) return MTLPropertyStorageNone;

    mtl_propertyAttributes *attributes = mtl_copyPropertyAttributes(property);
    @onExit {
        free(attributes);
    };

    if (attributes->readonly && attributes->ivar == NULL) {
        return MTLPropertyStorageNone;
    } else {
        return MTLPropertyStoragePermanent;
    }
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    return [[self alloc] initWithDictionary:dictionary error:error];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    self = [self init];
    if (self == nil) return nil;

    for (NSString *key in dictionary) {
        // Mark this as being autoreleased, because validateValue may return
        // a new object to be stored in this variable (and we don't want ARC to
        // double-free or leak the old or new values).
        __autoreleasing id value = [dictionary objectForKey:key];

        if ([value isEqual:NSNull.null]) value = nil;

        BOOL success = RLMValidateAndSetValue(self, key, value, YES, error);
        if (!success) return nil;
    }
    
    return self;
}

+ (NSSet *)transitoryPropertyKeys {
    NSSet *transitoryPropertyKeys = objc_getAssociatedObject(self, RLMModelCachedTransitoryPropertyKeysKey);

    if (transitoryPropertyKeys == nil) {
        [self generateAndCacheStorageBehaviors];
        transitoryPropertyKeys = objc_getAssociatedObject(self, RLMModelCachedTransitoryPropertyKeysKey);
    }

    return transitoryPropertyKeys;
}

+ (NSSet *)permanentPropertyKeys {
    NSSet *permanentPropertyKeys = objc_getAssociatedObject(self, RLMModelCachedPermanentPropertyKeysKey);

    if (permanentPropertyKeys == nil) {
        [self generateAndCacheStorageBehaviors];
        permanentPropertyKeys = objc_getAssociatedObject(self, RLMModelCachedPermanentPropertyKeysKey);
    }
    
    return permanentPropertyKeys;
}

- (NSDictionary *)dictionaryValue {
    NSSet *keys = [self.class.transitoryPropertyKeys setByAddingObjectsFromSet:self.class.permanentPropertyKeys];

    return [self dictionaryWithValuesForKeys:keys.allObjects];
}

- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}

- (BOOL)validate:(NSError *__autoreleasing *)error
{
    for (NSString *key in self.class.propertyKeys) {
        id value = [self valueForKey:key];

        BOOL success = RLMValidateAndSetValue(self, key, value, NO, error);
        if (!success) return NO;
    }
    
    return YES;
}

- (void)mergeValueForKey:(NSString *)key fromModel:(NSObject<MTLModel> *)model {
    NSParameterAssert(key != nil);

    SEL selector = MTLSelectorWithCapitalizedKeyPattern("merge", key, "FromModel:");
    if (![self respondsToSelector:selector]) {
        if (model != nil) {
            [self setValue:[model valueForKey:key] forKey:key];
        }

        return;
    }

    IMP imp = [self methodForSelector:selector];
    void (*function)(id, SEL, id<MTLModel>) = (__typeof__(function))imp;
    function(self, selector, model);
}

+ (NSSet *)propertyKeys {
    NSSet *cachedKeys = objc_getAssociatedObject(self, RLMModelCachedPropertyKeysKey);
    if (cachedKeys != nil) return cachedKeys;

    NSMutableSet *keys = [NSMutableSet set];

    [self enumeratePropertiesUsingBlock:^(objc_property_t property, BOOL *stop) {
        NSString *key = @(property_getName(property));

        if ([self storageBehaviorForPropertyWithKey:key] != MTLPropertyStorageNone) {
            [keys addObject:key];
        }
    }];

    // It doesn't really matter if we replace another thread's work, since we do
    // it atomically and the result should be the same.
    objc_setAssociatedObject(self, RLMModelCachedPropertyKeysKey, keys, OBJC_ASSOCIATION_COPY);
    
    return keys;
}

+ (void)enumeratePropertiesUsingBlock:(void (^)(objc_property_t property, BOOL *stop))block {
    Class cls = self;
    BOOL stop = NO;

    while (!stop && ![cls isEqual:MTLModel.class]) {
        unsigned count = 0;
        objc_property_t *properties = class_copyPropertyList(cls, &count);

        cls = cls.superclass;
        if (properties == NULL) continue;

        @onExit {
            free(properties);
        };

        for (unsigned i = 0; i < count; i++) {
            block(properties[i], &stop);
            if (stop) break;
        }
    }
}

@end
