//
//  TAFacadesAssembly.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TyphoonAssembly.h"

@class TAServicesAssembly,
TALoginFacade,
TADiscoveryFacade;

@protocol TAFacadesDataSource <NSObject>

- (TALoginFacade *)loginFacade;

- (TADiscoveryFacade *)discoveryFacade;

@end

@interface TAFacadesAssembly : TyphoonAssembly <TAFacadesDataSource>

@property (nonatomic) TAServicesAssembly *servicesAssembly;

@end
