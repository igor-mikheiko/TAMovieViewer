//
//  ADViewModelsAssembly.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModelsAssembly.h"
#import "TARootViewModel.h"

@implementation TAViewModelsAssembly

- (TAViewModel *)rootViewModel
{
    return [TyphoonDefinition withClass:[TARootViewModel class] configuration:^(TyphoonDefinition *definition) {

    }];
}

@end
