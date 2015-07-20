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
#import "TALoginViewController.h"

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

@end
