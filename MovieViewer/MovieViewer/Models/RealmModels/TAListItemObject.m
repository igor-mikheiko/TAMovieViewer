//
//  TAFavoriteItemObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAListItemObject.h"
#import <Mantle/MTLValueTransformer.h>
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "NSDateFormatter+TADateFormatters.h"

@implementation TAListItemObject

+ (NSString *)primaryKey
{
    return @"itemID";
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"backdropPath": @"backdrop_path",
             @"itemId": @"id",
             @"originalTitle": @"original_title",
             @"releaseDate": @"release_date",
             @"posterPath": @"poster_path",
             @"voteAverage": @"vote_average",
             @"voteCount": @"vote_count"
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

@implementation TAFavoriteListItemObject

@end

@implementation TAWatchedListItemObject

@end
