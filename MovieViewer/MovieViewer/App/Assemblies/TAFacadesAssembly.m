//
//  TAFacadesAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAFacadesAssembly.h"
#import "TAFacadeAbstract.h"
#import "TALoginFacade.h"
#import "TAServicesAssembly.h"

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
    }];
}

@end
