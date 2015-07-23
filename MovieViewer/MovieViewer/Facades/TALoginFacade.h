//
//  ADLoginFacade.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAFacadeAbstract.h"
#import "TAUserAuthInfo.h"

FOUNDATION_IMPORT NSString *const TAUserLogoutNotificationName;

typedef void(^ta_login_success_block)(void);
typedef void(^ta_login_failure_block)(NSError *error);

@interface TALoginFacade : TAFacadeAbstract

- (BOOL)isAlreadyAuthenticated;

- (void)authenticateWithUsername:(NSString *)username password:(NSString *)password success:(ta_login_success_block)success failure:(ta_login_failure_block)failure;

- (void)registerNewUser;

- (void)logout;

@end
