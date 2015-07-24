//
//  TADiscoveryMovieActionDelegate.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TADiscoveryMovieActionDelegate <NSObject>

@optional

- (void)performAddFavoriteDiscoveryViewModel:(id)viewModel;

- (void)performRemoveFavoriteDiscoveryViewModel:(id)viewModel;

- (void)performAddWatchedDiscoveryViewModel:(id)viewModel;

- (void)performRemoveWatchedDiscoveryViewModel:(id)viewModel;

@end
