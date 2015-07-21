//
//  TARouter.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TARouter.h"
#import "TARootViewController.h"
#import "TAViewsAssembly.h"
#import "TALoginViewController.h"
#import "TAMainViewController.h"
#import "TADiscoveryViewController.h"
#import "TAFavoritesViewController.h"
#import "TAWatchedViewController.h"

@implementation TARouter

- (instancetype)initWithRootViewController:(TARootViewController *)rootViewController
{
    self = [super init];
    if (self) {
        _rootViewController = rootViewController;
    }
    return self;
}

- (void)presentLoginScreen:(ta_router_completion)completion
{
    [self.rootViewController setFrontViewController:[self.viewsDataSource loginViewController]];

    if (completion) {
        completion();
    }

    DDLogVerbose(@"Login screen presented");
}

- (void)presentMainScreen:(ta_router_completion)completion
{
    [self.rootViewController setFrontViewController:[self.viewsDataSource mainViewController]];
    //TODO:
    if (completion) {
        completion();
    }

    DDLogVerbose(@"Main screen presented");
}

- (void)presentDiscoveryScreen:(ta_router_completion)completion
{
    if ([self.rootViewController.frontViewController isKindOfClass:[TAMainViewController class]]) {
        TAMainViewController *mainViewController = (TAMainViewController *)self.rootViewController.frontViewController;
        [mainViewController setCentralView:[self.viewsDataSource discoveryViewController]];
        [mainViewController revealToggleAnimated:YES];
    }

    if (completion) {
        completion();
    }
}

- (void)presentFavoritesScreen:(ta_router_completion)completion
{
    if ([self.rootViewController.frontViewController isKindOfClass:[TAMainViewController class]]) {
        TAMainViewController *mainViewController = (TAMainViewController *)self.rootViewController.frontViewController;
        [mainViewController setCentralView:[self.viewsDataSource favoritesViewController]];
        [mainViewController revealToggleAnimated:YES];
    }

    if (completion) {
        completion();
    }
}

- (void)presentWatchedScreen:(ta_router_completion)completion
{
    if ([self.rootViewController.frontViewController isKindOfClass:[TAMainViewController class]]) {
        TAMainViewController *mainViewController = (TAMainViewController *)self.rootViewController.frontViewController;
        [mainViewController setCentralView:[self.viewsDataSource watchedViewController]];
        [mainViewController revealToggleAnimated:YES];
    }

    if (completion) {
        completion();
    }
}

@end
