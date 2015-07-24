//
//  TAListItemAction.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAActionProtocol.h"
#import "TAServiceProvider.h"
#import "TAListItemObject.h"

@interface TAListItemAction : NSObject <TAActionProtocol>

@property (nonatomic, strong, readonly) TAListItemObject *listItem;

- (instancetype)initWithItem:(TAListItemObject *)item;

@end
