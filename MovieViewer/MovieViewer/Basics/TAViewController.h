//
//  TAViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAViewModel.h"

@interface TAViewController : UIViewController

@property (nonatomic, strong, readonly) TAViewModel *viewModel;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil viewModel:(TAViewModel *)viewModel NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithViewModel:(TAViewModel *)viewModel NS_DESIGNATED_INITIALIZER;

@end
