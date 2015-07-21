//
//  ADViewsAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TyphoonAssembly.h"

@class TARootViewController,
TAMainViewController,
TALoginViewController,
TADiscoveryViewController,
TAFavoritesViewController,
TAWatchedViewController;

@protocol TAViewsDataSource <NSObject>

- (TARootViewController *)rootViewController;

- (TALoginViewController *)loginViewController;

- (TADiscoveryViewController *)discoveryViewController;

- (TAFavoritesViewController *)favoritesViewController;

- (TAWatchedViewController *)watchedViewController;

- (TAMainViewController *)mainViewController;

@end

@class TAViewModelsAssembly;

@interface TAViewsAssembly : TyphoonAssembly <TAViewsDataSource>

@property (nonatomic, strong) TAViewModelsAssembly *viewModelsAssembly;

@end
