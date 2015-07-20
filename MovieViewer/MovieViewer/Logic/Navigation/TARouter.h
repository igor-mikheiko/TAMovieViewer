//
//  TARouter.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TARootViewController;

@protocol TAViewsDataSource;

typedef void(^ta_router_completion)(void);

@interface TARouter : NSObject

@property (nonatomic, weak, readonly) TARootViewController *rootViewController;

@property (nonatomic, strong) NSObject<TAViewsDataSource> *viewsDataSource;

- (instancetype)initWithRootViewController:(TARootViewController *)rootViewController;

- (void)presentLoginScreen:(ta_router_completion)completion;

- (void)presentMainScreen:(ta_router_completion)completion;

- (void)presentDiscoveryScreen:(ta_router_completion)completion;

- (void)presentFavoritesScreen:(ta_router_completion)completion;

- (void)presentWatchedScreen:(ta_router_completion)completion;

@end
