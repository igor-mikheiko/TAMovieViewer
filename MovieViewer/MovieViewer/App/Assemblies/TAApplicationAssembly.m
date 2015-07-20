//
//  ADApplicationAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAApplicationAssembly.h"
#import "TAAppDelegate.h"
#import "TAViewsAssembly.h"

@implementation TAApplicationAssembly

- (TAAppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[TAAppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:[self mainWindow]];
    }];
}

- (UIWindow *)mainWindow
{
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
        
        [definition injectProperty:@selector(rootViewController) with:[self.viewsAssembly rootViewController]];
    }];
}

@end
