//
//  ADViewsAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewsAssembly.h"
#import "TARootViewController.h"
#import "TAViewModelsAssembly.h"

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

@end
