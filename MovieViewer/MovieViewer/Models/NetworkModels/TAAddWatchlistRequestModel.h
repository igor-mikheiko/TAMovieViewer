//
// Created by Uladzimir Predka on 7/22/15.
// Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TAAddWatchlistRequestModel : MTLModel <MTLJSONSerializing>

@property  (nonatomic) NSUInteger mediaId;

@property (nonatomic) BOOL watchlist;

@end