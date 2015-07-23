//
//  TAServicesAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TyphoonAssembly.h"

@class TAServiceProvider;

@protocol TAServicesDataSource <NSObject>

- (TAServiceProvider *)serviceProvider;

@end

@interface TAServicesAssembly : TyphoonAssembly <TAServicesDataSource>

@end
