//
//  TADiscoverMovieResponseObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TADiscoverResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic) NSUInteger page;
@property (nonatomic, strong) NSArray *results;
@property (nonatomic) NSUInteger totalPages;
@property (nonatomic) NSUInteger totalResults;

@end
