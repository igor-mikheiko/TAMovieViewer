//
//  TARootViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAViewController.h"

@class TARootViewModel;

@protocol TARootViewController <NSObject>

@property (nonatomic, strong, readonly) TARootViewModel *viewModel;

@end

@interface TARootViewController : TAViewController <TARootViewController>

@property (nonatomic, strong, readonly) UIViewController *frontViewController;

- (void)setFrontViewController:(UIViewController *)viewController;

@end
