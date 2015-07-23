//
//  ADViewModelsAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModelsAssembly.h"
#import "TAApplicationAssembly.h"
#import "TAFacadesAssembly.h"
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
        definition.parent = [self _basicViewModel];
    }];
}

- (TAViewModel *)menuViewModel
{
    return [TyphoonDefinition withClass:[TAMenuViewModel class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicViewModel];
        [definition injectProperty:@selector(loginFacade) with:[self.facadesAssembly loginFacade]];
    }];
}

- (TAViewModel *)loginViewModel
{
    return [TyphoonDefinition withClass:[TALoginViewModel class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicViewModel];
        [definition injectProperty:@selector(facade) with:[self.facadesAssembly loginFacade]];
    }];
}

- (TAViewModel *)discoveryViewModel
{
    return [TyphoonDefinition withClass:[TADiscoveryViewModel class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicViewModel];
    }];
}

- (TAViewModel *)favoritesViewModel
{
    return [TyphoonDefinition withClass:[TAFavoritesViewModel class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicViewModel];
    }];
}

- (TAViewModel *)watchedViewModel
{
    return [TyphoonDefinition withClass:[TAWatchedViewModel class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self _basicViewModel];
    }];
}

#pragma mark - Parents

- (TAViewModel *)_basicViewModel
{
    return [TyphoonDefinition withClass:[TAViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:[self.applicationAssembly appRouter]];
    }];
}

@end
