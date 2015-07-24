//
//  TADiscoveryResponceObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TADiscoveryObject.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "TADiscoverItemObject.h"

@implementation TADiscoveryObject

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
    return [MTLJSONAdapter arrayTransformerWithModelClass:[TADiscoverItemObject class]];
}

@end
