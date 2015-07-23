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


@implementation TALoginFacade {
    NSString *_requestToken;
    NSString *_sessionId;
}

- (BOOL)isAlreadyAuthenticated
{
    return [_requestToken length] && [_sessionId length];
}

- (void)authenticateWithUsername:(NSString *)username password:(NSString *)password success:(ta_login_success_block)success failure:(ta_login_failure_block)failure
{
    TAUserAuthInfo *authInfo = [TAUserAuthInfo new];
    authInfo.login = username;
    authInfo.password = password;
    [self.serviceProvider validateUserAuthInfo:authInfo withSuccessBlock:^(TAValidateResponseModel *authResponse) {
        if (authResponse.success) {
            _requestToken = authResponse.requestToken;
            [self.serviceProvider createNewSessionWithSuccessBlock:^(TANewSessionResponseModel *sessionResponse) {
                if (sessionResponse.success) {
                    _sessionId = sessionResponse.sessionId;
                    BLOCK_EXEC(success)
                }
            } andErrorBlock:^(NSError *error) {
                NSError *loginError = [NSError errorWithUnderlyingError:error domain:TAMakeAppDomain(TALoginFacadeError) code:error.code userInfo:error.userInfo];
                BLOCK_EXEC(failure, loginError)
            }];
        } else {
            NSError *error = [NSError errorWithDomain:TAMakeAppDomain(TALoginFacadeError) code:TALoginUndefined userInfo:nil];
            BLOCK_EXEC(failure, error)
        }
    } andErrorBlock:^(NSError *error) {
        NSError *loginError = [NSError errorWithUnderlyingError:error domain:TAMakeAppDomain(TALoginFacadeError) code:1 userInfo:nil];
        BLOCK_EXEC(failure, loginError);
    }];
}

- (void)logout
{
    _requestToken = nil;
    _sessionId = nil;

    [[NSNotificationCenter defaultCenter] postNotificationName:TAUserLogoutNotificationName object:nil];
}

- (void)registerNewUser
{
    //TODO
}

@end
