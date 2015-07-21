//
// Created by Uladzimir Predka on 7/21/15.
// Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TADiscoverRequestParametersModel : MTLModel<MTLJSONSerializing>

@property  (nonatomic) NSUInteger page;

@end