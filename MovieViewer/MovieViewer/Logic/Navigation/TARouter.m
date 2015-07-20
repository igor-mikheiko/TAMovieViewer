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
}

- (void)presentMainScreen:(ta_router_completion)completion
{
    //TODO:
    if (completion) {
        completion();
    }
}

@end
