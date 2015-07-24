//
//  TADiscoveryMovieViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TADiscoveryMovieViewModel.h"
#import "TADiscoverItemObject.h"

@implementation TADiscoveryMovieViewModel {
    TADiscoverItemObject *_discoveryItem;
}

- (instancetype)initWithDiscovery:(TADiscoverItemObject *)discoveryItem
{
    self = [super init];
    if (self) {
        _discoveryItem = discoveryItem;
    }
    return self;
}

- (NSString *)title
{
    return [_discoveryItem title];
}

- (BOOL)isFavorite
{
    return NO;
}

- (BOOL)isWatched
{
    return NO;
}

- (void)performAddToFavoriteAction
{
    if ([self.actionDelegate respondsToSelector:@selector(performAddFavoriteDiscoveryViewModel:)]) {
        [self.actionDelegate performAddFavoriteDiscoveryViewModel:self];
    }
}

- (void)performRemoveFromFavoriteAction
{
    if ([self.actionDelegate respondsToSelector:@selector(performRemoveFavoriteDiscoveryViewModel:)]) {
        [self.actionDelegate performRemoveFavoriteDiscoveryViewModel:self];
    }
}

- (void)performAddToWatchedAction
{
    if ([self.actionDelegate respondsToSelector:@selector(performAddWatchedDiscoveryViewModel:)]) {
        [self.actionDelegate performAddWatchedDiscoveryViewModel:self];
    }
}

- (void)performRemoveFromWatchedAction
{
    if ([self.actionDelegate respondsToSelector:@selector(performRemoveWatchedDiscoveryViewModel:)]) {
        [self.actionDelegate performRemoveWatchedDiscoveryViewModel:self];
    }
}

@end
