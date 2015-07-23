//
//  TAErrors.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSError+EmbeddedError.h"

static inline NSString *TAMakeAppDomain(NSString *appendix)
{
    return [NSString stringWithFormat:@"com.instinctools.%@", appendix];
}

FOUNDATION_EXPORT NSString *const TALoginFacadeError;
FOUNDATION_EXPORT NSString *const TADiscoveryFacadeError;

typedef NS_ENUM(NSUInteger, TALoginError) {
    TALoginErrorParameters,
    TALoginUndefined
};