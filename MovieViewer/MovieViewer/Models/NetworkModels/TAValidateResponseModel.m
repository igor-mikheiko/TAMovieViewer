//
//  TAValidateResponseObject.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAValidateResponseModel.h"

@implementation TAValidateResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"requestToken": @"request_token"
             };
}

@end
