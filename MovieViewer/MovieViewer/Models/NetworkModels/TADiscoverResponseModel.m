//
//  TADiscoverMovieResponseObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TADiscoverResponseModel.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "TADiscoverItemResponseModel.h"

@implementation TADiscoverResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"page": @"page",
             @"results": @"results",
             @"totalPages": @"total_pages",
             @"totalResults": @"total_results"
             };
}

+ (NSValueTransformer *)resultsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[TADiscoverItemResponseModel class]];
}

@end
