//
//  NSDateFormatter+TADateFormatters.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (TADateFormatters)

+ (NSDateFormatter *)ta_sharedLongDateFormatter;
+ (NSDateFormatter *)ta_sharedShortDateFormatter;
@end
