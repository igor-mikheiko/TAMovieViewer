//
//  ADViewsAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TyphoonAssembly.h"

@class TARootViewController,
TALoginViewController;

@protocol TAViewsDataSource <NSObject>

- (TARootViewController *)rootViewController;

- (TALoginViewController *)loginViewController;


@end

@class TAViewModelsAssembly;

@interface TAViewsAssembly : TyphoonAssembly <TAViewsDataSource>

@property (nonatomic, strong) TAViewModelsAssembly *viewModelsAssembly;

@end
