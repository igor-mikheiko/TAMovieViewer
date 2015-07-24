//
//  TADiscoveryMovieViewModel.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModel.h"
#import "TADiscoveryMovieActionDelegate.h"

@class TADiscoverItemObject;

@protocol TADiscoveryMovieViewDelegate <NSObject>

- (void)updateView;

@end

@interface TADiscoveryMovieViewModel : TAViewModel

- (instancetype)initWithDiscovery:(TADiscoverItemObject *)discoveryItem;

@property (nonatomic, weak) NSObject<TADiscoveryMovieViewDelegate> *viewDelegate;

@property (nonatomic, weak) NSObject<TADiscoveryMovieActionDelegate> *actionDelegate;

@property (nonatomic, readonly) NSString *title;

@property (nonatomic, readonly, getter=isFavorite) BOOL favorite;

@property (nonatomic, readonly, getter=isWatched) BOOL watched;

- (void)performAddToFavoriteAction;

- (void)performRemoveFromFavoriteAction;

- (void)performAddToWatchedAction;

- (void)performRemoveFromWatchedAction;

@end
