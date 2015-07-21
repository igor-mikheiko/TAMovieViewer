//
//  TALoginViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TALoginViewModel.h"

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
    if (self.loginString.length == 0 || self.passwordString.length == 0) {
        DDLogVerbose(@"Login failed");
        [self.viewDelegate loginActionFailedWithError:nil];
    } else {
        DDLogVerbose(@"Login successfull");
        [self.viewDelegate loginActionSuccessed];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.7f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.router presentMainScreen:^{
            }];
        });
    }

}

@end
