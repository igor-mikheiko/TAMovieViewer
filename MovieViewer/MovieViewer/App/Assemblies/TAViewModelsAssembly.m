//
//  ADViewModelsAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModelsAssembly.h"
#import "TARootViewModel.h"
#import "TALoginViewModel.h"
#import "TADiscoveryViewModel.h"
#import "TAFavoritesViewModel.h"
#import "TAWatchedViewModel.h"
#import "TAMenuViewModel.h"

@implementation TAViewModelsAssembly

- (TAViewModel *)rootViewModel
{
    return [TyphoonDefinition withClass:[TARootViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

- (TAViewModel *)menuViewModel
{
    return [TyphoonDefinition withClass:[TAMenuViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

- (TAViewModel *)loginViewModel
{
    return [TyphoonDefinition withClass:[TALoginViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

- (TAViewModel *)discoveryViewModel
{
    return [TyphoonDefinition withClass:[TADiscoveryViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

- (TAViewModel *)favoritesViewModel
{
    return [TyphoonDefinition withClass:[TAFavoritesViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

- (TAViewModel *)watchedViewModel
{
    return [TyphoonDefinition withClass:[TAWatchedViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

@end
