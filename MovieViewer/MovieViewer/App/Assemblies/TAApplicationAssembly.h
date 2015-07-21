//
//  ADApplicationAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Typhoon/TyphoonAssembly.h>

@class TAViewsAssembly,
TARouter;

@interface TAApplicationAssembly : TyphoonAssembly

@property (nonatomic, strong) TAViewsAssembly *viewsAssembly;

- (TARouter *)appRouter;

@end
