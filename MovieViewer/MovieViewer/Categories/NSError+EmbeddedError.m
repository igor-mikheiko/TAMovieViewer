//
//  NSError+EmbeddedError.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "NSError+EmbeddedError.h"

@implementation NSError (EmbeddedError)

- (instancetype)initWithUnderlyingError:(NSError *)error domain:(NSString *)domain code:(NSUInteger)code userInfo:(NSDictionary *)userInfo
{
    NSMutableDictionary *updatedUserInfo = userInfo ? [NSMutableDictionary dictionaryWithDictionary:userInfo] : [NSMutableDictionary dictionary];
    updatedUserInfo[NSUnderlyingErrorKey] = error;
    return [self initWithDomain:domain code:code userInfo:[NSDictionary dictionaryWithDictionary:updatedUserInfo]];
}

+ (instancetype)errorWithUnderlyingError:(NSError *)error domain:(NSString *)domain code:(NSUInteger)code userInfo:(NSDictionary *)userInfo
{
    return [[NSError alloc] initWithUnderlyingError:error domain:domain code:code userInfo:userInfo];
}

@end
