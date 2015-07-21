//
//  TALoginViewModel.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModel.h"

@protocol TALoginViewDelegate <NSObject>

- (void)loginActionFailedWithError:(NSError *)error;

- (void)loginActionSuccessed;

@end

@interface TALoginViewModel : TAViewModel

@property (nonatomic, weak) NSObject<TALoginViewDelegate> *viewDelegate;

@property (nonatomic) NSString *loginString;

@property (nonatomic) NSString *passwordString;

- (void)performLoginAction;

@end
