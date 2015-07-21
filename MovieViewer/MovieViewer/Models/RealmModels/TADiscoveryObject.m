//
//  TADiscoveryResponceObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TADiscoveryObject.h"

@implementation TADiscoveryObject

+ (NSDictionary *) JSONInboundMappingDictionary{
    return @{@"page" : @"page",
             @"results" : @"results",
             @"total_pages" : @"totalPages",
             @"total_results" : @"totalResults"};
}


@end
