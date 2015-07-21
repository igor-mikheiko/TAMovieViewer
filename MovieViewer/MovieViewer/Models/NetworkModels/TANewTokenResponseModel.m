//
//  TANewTokenResponseObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TANewTokenResponseModel.h"
#import <Mantle/MTLValueTransformer.h>
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>
#import "NSDateFormatter+TADateFormatters.h"

@implementation TANewTokenResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"expiresAt": @"expires_at",
             @"requestToken": @"request_token"
             };
}

+ (NSValueTransformer *) expiresAtJSONTransformer{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *str, BOOL *success, NSError *__autoreleasing *error) {
        NSDate *date = [[NSDateFormatter ta_sharedLongDateFormatter] dateFromString:str];
        return date;
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [[NSDateFormatter ta_sharedLongDateFormatter] stringFromDate:date];
    }];
}

@end
