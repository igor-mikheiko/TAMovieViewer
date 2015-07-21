//
//  TAMoviesListResponseModel.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAListResponseModel.h"
#import "TAListItemResponseModel.h"

@implementation TAListResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"totalPages": @"total_pages",
             @"totalResults": @"total_results"
             };
}

+ (NSValueTransformer *)resultsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[TAListItemResponseModel class]];
}

@end
