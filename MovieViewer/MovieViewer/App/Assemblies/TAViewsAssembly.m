//
//  ADViewsAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewsAssembly.h"
#import "TAViewModelsAssembly.h"
#import "TARootViewController.h"
#import "TAMainViewController.h"
#import "TALoginViewController.h"
#import "TADiscoveryViewController.h"
#import "TAFavoritesViewController.h"
#import "TAWatchedViewController.h"
#import "TAMenuViewController.h"

@implementation TAViewsAssembly

- (TARootViewController *)rootViewController
{
    return [TyphoonDefinition withClass:[TARootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithViewModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self.viewModelsAssembly rootViewModel]];
        }];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (TAMainViewController *)mainViewController
{
    return [TyphoonDefinition withClass:[TAMainViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(menuView) with:[self menuViewController]];
        [definition injectProperty:@selector(centralView) with:[self discoveryViewController]];

        definition.scope = TyphoonScopeSingleton;
    }];
}

- (TAMenuViewController *)menuViewController
{
    return [TyphoonDefinition withClass:[TAMenuViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:viewModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:NSStringFromClass([TAMenuViewController class])];
            [initializer injectParameterWith:[NSBundle mainBundle]];
            [initializer injectParameterWith:[self.viewModelsAssembly menuViewModel]];
        }];
    }];
}

- (TALoginViewController *)loginViewController
{
    return [TyphoonDefinition withClass:[TALoginViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:viewModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:NSStringFromClass([TALoginViewController class])];
            [initializer injectParameterWith:[NSBundle mainBundle]];
            [initializer injectParameterWith:[self.viewModelsAssembly loginViewModel]];
        }];
    }];
}

- (TADiscoveryViewController *)discoveryViewController
{
    return [TyphoonDefinition withClass:[TADiscoveryViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:viewModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TATableViewControllerNibName];
            [initializer injectParameterWith:[NSBundle mainBundle]];
            [initializer injectParameterWith:[self.viewModelsAssembly discoveryViewModel]];
        }];
    }];
}

- (TAFavoritesViewController *)favoritesViewController
{
    return [TyphoonDefinition withClass:[TAFavoritesViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:viewModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TATableViewControllerNibName];
            [initializer injectParameterWith:[NSBundle mainBundle]];
            [initializer injectParameterWith:[self.viewModelsAssembly favoritesViewModel]];
        }];
    }];
}

- (TAWatchedViewController *)watchedViewController
{
    return [TyphoonDefinition withClass:[TAWatchedViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithNibName:bundle:viewModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:TATableViewControllerNibName];
            [initializer injectParameterWith:[NSBundle mainBundle]];
            [initializer injectParameterWith:[self.viewModelsAssembly watchedViewModel]];
        }];
    }];
}

@end
