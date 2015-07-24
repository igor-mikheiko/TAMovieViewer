//
//  TAFacadesAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAFacadesAssembly.h"
#import "TAServicesAssembly.h"
#import "TAFacadeAbstract.h"
#import "TALoginFacade.h"
#import "TADiscoveryFacade.h"
#import "TAFavoritesMoviesFacade.h"
#import "TAWatchedMoviesFacade.h"

static NSUInteger const kDefaultPageSize = 20;

@implementation TAFacadesAssembly

- (TAFacadeAbstract *)_basicFacade
{
    return [TyphoonDefinition withClass:[TAFacadeAbstract class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(serviceProvider) with:[self.servicesAssembly serviceProvider]];
    }];
}

- (TALoginFacade *)loginFacade
{
    return [TyphoonDefinition withClass:[TALoginFacade class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicFacade];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (TADiscoveryFacade *)discoveryFacade
{
    return [TyphoonDefinition withClass:[TADiscoveryFacade class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicFacade];
        [definition injectProperty:@selector(loginFacade) with:[self loginFacade]];
        [definition injectProperty:@selector(pageSize) with:@(kDefaultPageSize)];
    }];
}

- (TAFavoritesMoviesFacade *)favoriteMoviesFacade
{
    return [TyphoonDefinition withClass:[TAFavoritesMoviesFacade class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicFacade];
        [definition injectProperty:@selector(loginFacade) with:[self loginFacade]];
        [definition injectProperty:@selector(pageSize) with:@(kDefaultPageSize)];
    }];
}

- (TAWatchedMoviesFacade *)watchedMoviesFacade
{
    return [TyphoonDefinition withClass:[TAWatchedMoviesFacade class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicFacade];
        [definition injectProperty:@selector(loginFacade) with:[self loginFacade]];
        [definition injectProperty:@selector(pageSize) with:@(kDefaultPageSize)];
    }];
}

@end
