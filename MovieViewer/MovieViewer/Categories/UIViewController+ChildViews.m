//
//  UIViewController+ChildViews.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "UIViewController+ChildViews.h"
#import <Masonry/Masonry.h>

@implementation UIViewController (ChildViews)

- (void)removeOldChildViewController:(UIViewController *)viewController
{
    [viewController removeFromParentViewController];
    [viewController.view removeFromSuperview];
    [viewController didMoveToParentViewController:nil];
}

- (void)addNewChildViewController:(UIViewController *)viewController intoContainer:(UIView *)containerView
{
    [self addChildViewController:viewController];
    [containerView addSubview:viewController.view];
    [viewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(containerView);
    }];
    [viewController didMoveToParentViewController:self];
    [containerView layoutIfNeeded];
}

@end
