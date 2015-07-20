//
//  ADViewModelsAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TyphoonAssembly.h"

@class TAViewModel;

@protocol TAViewModelsDataSource <NSObject>

- (TAViewModel *)rootViewModel;

@end

@interface TAViewModelsAssembly : TyphoonAssembly <TAViewModelsDataSource>

@end
