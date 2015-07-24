//
//  TAOfflineActionsManager.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TAActionProtocol.h"

@interface TAOfflineActionsManager : NSObject

+ (NSArray<TAActionProtocol> *)loadStoredActions;

@end
