//
//  NSError+EmbeddedError.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (EmbeddedError)

- (instancetype)initWithUnderlyingError:(NSError *)error domain:(NSString *)domain code:(NSUInteger)code userInfo:(NSDictionary *)userInfo;

+ (instancetype)errorWithUnderlyingError:(NSError *)error domain:(NSString *)domain code:(NSUInteger)code userInfo:(NSDictionary *)userInfo;

@end
