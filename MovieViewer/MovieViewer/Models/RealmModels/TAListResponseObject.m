//
//  TAFavoriteResponseObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAListResponseObject.h"

@implementation TAListResponseObject

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"totalPages": @"total_pages",
             @"totalResults": @"total_results"
             };
}

+ (NSValueTransformer *)resultsJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[TAListItemObject class]];
}


@end
