//
//  TAFavoriteResponseModel.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAListChangedResponseModel.h"

@implementation TAListChangedResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"statusCode": @"status_code",
             @"statusMessage": @"status_message"
             };
}

@end
