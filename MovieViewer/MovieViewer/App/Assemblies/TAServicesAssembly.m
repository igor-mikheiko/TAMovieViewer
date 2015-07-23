//
//  TAServicesAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAServicesAssembly.h"
#import "TAServiceProvider.h"

@implementation TAServicesAssembly

- (TAServiceProvider *)serviceProvider
{
    return [TyphoonDefinition withClass:[TAServiceProvider class] configuration:^(TyphoonDefinition *definition) {

    }];
}

@end
