//
//  NSDateFormatter+TADateFormatters.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "NSDateFormatter+TADateFormatters.h"

@implementation NSDateFormatter (TADateFormatters)

+ (NSDateFormatter *)ta_sharedLongDateFormatter
{
    static NSDateFormatter *sharedLongDateFormatter = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedLongDateFormatter = [NSDateFormatter new];
        sharedLongDateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    });
    return sharedLongDateFormatter;
}

+ (NSDateFormatter *)ta_sharedShortDateFormatter
{
    static NSDateFormatter *sharedShortDateFormatter = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedShortDateFormatter = [NSDateFormatter new];
        sharedShortDateFormatter.dateFormat = @"yyyy-MM-dd";
    });
    return sharedShortDateFormatter;
}


@end
