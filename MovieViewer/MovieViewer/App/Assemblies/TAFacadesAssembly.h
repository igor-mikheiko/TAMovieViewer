//
//  TAFacadesAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TyphoonAssembly.h"

@protocol TAServicesDataSource;

@class TALoginFacade,
TADiscoveryFacade,
TAFavoritesMoviesFacade,
TAWatchedMoviesFacade;

@protocol TAFacadesDataSource <NSObject>

- (TALoginFacade *)loginFacade;

- (TADiscoveryFacade *)discoveryFacade;

- (TAFavoritesMoviesFacade *)favoriteMoviesFacade;

- (TAWatchedMoviesFacade *)watchedMoviesFacade;

@end

@interface TAFacadesAssembly : TyphoonAssembly <TAFacadesDataSource>

@property (nonatomic) TyphoonAssembly<TAServicesDataSource> *servicesAssembly;

@end
