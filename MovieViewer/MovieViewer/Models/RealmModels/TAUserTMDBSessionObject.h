//
// Created by Uladzimir Predka on 7/24/15.
// Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMObject.h"
#import "TAUserProfile.h"

@interface TAUserTMDBSessionObject : RLMObject

@property NSString *authToken;
@property NSString *sessionToken;
@property NSString *sessionId;
@property NSString *username;

@property TAUserProfile *userProfile;

@end
