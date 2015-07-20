//
//  TARootViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TARootViewController.h"
#import "TARootViewModel.h"
#import <Masonry/Masonry.h>

@interface TARootViewController ()

@end

@implementation TARootViewController {
    __strong UIViewController *_frontViewController;
}

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

    [self _removeOldChildViewController:_frontViewController];
    _frontViewController = viewController;
    [self _addNewChildViewController:_frontViewController];

}

#pragma mark - Private

- (void)_removeOldChildViewController:(UIViewController *)viewController
{
    [viewController removeFromParentViewController];
    [viewController.view removeFromSuperview];
    [viewController didMoveToParentViewController:nil];
}

- (void)_addNewChildViewController:(UIViewController *)viewController
{
    [self addChildViewController:viewController];
    [self.view addSubview:viewController.view];
    [viewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [viewController didMoveToParentViewController:self];
    [self.view layoutIfNeeded];
}

@end
