//
//  TAListItemAction.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAListItemAction.h"

@implementation TAListItemAction
@synthesize serviceProvider = _serviceProvider;

- (instancetype)initWithItem:(TAListItemObject *)item
{
    self = [super init];
    if (self) {
        _listItem = item;
    }
    return self;
}

- (void)do:(void (^)(BOOL))completion
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Should overwite methood" userInfo:nil];
}

@end
