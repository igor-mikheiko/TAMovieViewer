//
//  UIViewController+ChildViews.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ChildViews)

- (void)removeOldChildViewController:(UIViewController *)viewController;

- (void)addNewChildViewController:(UIViewController *)viewController intoContainer:(UIView *)containerView;

@end
