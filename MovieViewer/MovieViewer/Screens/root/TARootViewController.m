//
//  TARootViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TARootViewController.h"
#import "TARootViewModel.h"
#import "UIViewController+ChildViews.h"

@interface TARootViewController ()

@end

@implementation TARootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.viewModel preloadScreen];
}

- (void)setFrontViewController:(UIViewController *)viewController
{
    if (_frontViewController) {
        [UIView transitionFromView:_frontViewController.view toView:viewController.view duration:.4f options:UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {

        }];
    }

    [self removeOldChildViewController:_frontViewController];
    _frontViewController = viewController;
    [self addNewChildViewController:_frontViewController intoContainer:self.view];

}

@end
