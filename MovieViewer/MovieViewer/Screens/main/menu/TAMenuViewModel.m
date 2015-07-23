//
//  TAMenuViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMenuViewModel.h"
#import "TALoginFacade.h"

@implementation TAMenuViewModel

- (void)performShowDiscovery
{
    [self.router presentDiscoveryScreen:^{
    }];
}

- (void)performShowFavorites
{
    [self.router presentFavoritesScreen:^{

    }];
}

- (void)performShowWatched
{
    [self.router presentWatchedScreen:^{

    }];
}

- (void)performLogOutAction
{
    [self.loginFacade logout];
    [self.router presentLoginScreen:^{

    }];
}

@end
