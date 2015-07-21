//
//  TAListItemResponseModel.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAListItemResponseModel.h"
#import <Mantle/MTLValueTransformer.h>
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "NSDateFormatter+TADateFormatters.h"

@implementation TAListItemResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"backdropPath": @"backdrop_path",
             @"itemId": @"id",
             @"originalTitle":@"original_title",
             @"releaseDate":@"release_date",
             @"posterPath":@"poster_path",
             @"voteAverage":@"vote_average",
             @"voteCount":@"vote_count"
             };
}

+ (NSValueTransformer *) releaseDateJSONTransformer{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *str, BOOL *success, NSError *__autoreleasing *error) {
        NSDate *date = [[NSDateFormatter ta_sharedShortDateFormatter] dateFromString:str];
        return date;
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [[NSDateFormatter ta_sharedShortDateFormatter] stringFromDate:date];
    }];
}

@end