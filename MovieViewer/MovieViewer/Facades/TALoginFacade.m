//
//  ADLoginFacade.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TALoginFacade.h"
#import "TAValidateResponseModel.h"
#import "TANewSessionResponseModel.h"
#import "TAErrors.h"
#import <Realm/Realm.h>

@implementation TALoginFacade {
    BOOL _shouldCheckAuthentication;
    BOOL _isLastAuthorized;
}

- (void)checkUserAuthorization:(ta_login_check)checkCompletion
{
    if (_shouldCheckAuthentication) {
        RLMRealm *storage = [RLMRealm defaultRealm];
        RLMResults *users = [TAUserProfile allObjectsInRealm:storage];

        if ([users count] == 0) {
            _isLastAuthorized = NO;
            _shouldCheckAuthentication = NO;
            BLOCK_EXEC(checkCompletion, _isLastAuthorized)
            return;
        }

        void(^checkUser)(TAUserProfile *user, NSUInteger const nextIndex) = ^(TAUserProfile *user, NSUInteger const nextIndex) {
            [self.serviceProvider checkUser:user.username isAuthorized:^(BOOL isAuthorized) {
                if (isAuthorized) {
                    _shouldCheckAuthentication = NO;
                    _isLastAuthorized = YES;
                    _user = user;
                    BLOCK_EXEC(checkCompletion, isAuthorized)
                } else {
                    if ([users count] > nextIndex) {
                        checkUser(users[nextIndex], nextIndex + 1);
                    } else {
                        _shouldCheckAuthentication = NO;
                        _isLastAuthorized = NO;
                        BLOCK_EXEC(checkCompletion, _isLastAuthorized)
                    }
                }
            }];
        };

        checkUser([users firstObject], 1);
    } else {
        BLOCK_EXEC(checkCompletion, _isLastAuthorized)
    }
}

- (void)authenticateWithUsername:(NSString *)username password:(NSString *)password success:(ta_login_success_block)success failure:(ta_login_failure_block)failure
{
    TAUserAuthInfo *authInfo = [TAUserAuthInfo new];
    authInfo.login = username;
    authInfo.password = password;
    [self.serviceProvider validateUserAuthInfo:authInfo withSuccessBlock:^{
        RLMRealm *storage = [RLMRealm defaultRealm];
        TAUserProfile *user = [TAUserProfile objectForPrimaryKey:username];
        if (user) {
            _user = user;
        } else {
            TAUserProfile *newUser = [TAUserProfile new];
            newUser.username = username;
            [storage beginWriteTransaction];
            _user = [TAUserProfile createOrUpdateInRealm:storage withValue:newUser];
            [storage commitWriteTransaction];
        }
        BLOCK_EXEC(success)
    } andErrorBlock:^(NSError *error) {
        _user = nil;
        NSError *loginError = [NSError errorWithUnderlyingError:error domain:TAMakeAppDomain(TALoginFacadeError) code:1 userInfo:nil];
        BLOCK_EXEC(failure, loginError);
    }];
}

- (void)logout
{
    _shouldCheckAuthentication = YES;
    _isLastAuthorized = NO;
    [self.serviceProvider logoutCurrentUser];

    [[NSNotificationCenter defaultCenter] postNotificationName:TAUserLogoutNotificationName object:nil];
}

- (void)registerNewUser
{
    //TODO
}

@end
