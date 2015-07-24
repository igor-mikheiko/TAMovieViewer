//
//  TALoginViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TALoginViewModel.h"
#import "TAErrors.h"
#import "TALoginFacade.h"

@implementation TALoginViewModel
@synthesize viewDelegate;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.loginString = @"test";
        self.passwordString = @"1";
    }
    return self;
}

- (void)performLoginAction
{
    void(^afterSuccess)(void) = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.7f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.router presentMainScreen:^{
            }];
        });
    };

    [self.viewDelegate loginActionSuccessed];
    BLOCK_EXEC(afterSuccess)
    return;


    if (self.loginString.length == 0 || self.passwordString.length == 0) {
        NSError *error = [NSError errorWithDomain:TAMakeAppDomain(@"loginViewModel") code:1 userInfo:@{ NSLocalizedDescriptionKey: @"Too short parameters" }];
        DDLogVerbose(@"Login failed::%@", [error localizedDescription]);
        [self.viewDelegate loginActionFailedWithError:error];
    } else {
        [self.facade checkUserAuthorization:^(BOOL isAuthorized) {
            if (isAuthorized) {
                DDLogVerbose(@"Login successfull (already exists)");
                [self.viewDelegate loginActionSuccessed];
                BLOCK_EXEC(afterSuccess)
            } else {
                [self.facade authenticateWithUsername:self.loginString password:self.passwordString success:^{
                    DDLogVerbose(@"Login successfull (request)");
                    [self.viewDelegate loginActionSuccessed];
                    BLOCK_EXEC(afterSuccess)
                } failure:^(NSError *error) {
                    DDLogVerbose(@"Login failed::%@", [error localizedDescription]);
                    [self.viewDelegate loginActionFailedWithError:error];
                }];
            }
        }];
    }
}

- (void)performRegistrationAction
{
    [self.facade registerNewUser];
}

@end
