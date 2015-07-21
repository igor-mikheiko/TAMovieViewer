//
//  TACentralViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TACentralViewController.h"
#import <Masonry/Masonry.h>
#import "UIViewController+ChildViews.h"

@interface TACentralViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation TACentralViewController {
    UIViewController *_childViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setViewController:(UIViewController *)viewController
{
    if (self.view) {
        if (_childViewController) {
            [UIView transitionFromView:_childViewController.view toView:viewController.view duration:.4f options:UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {

            }];
        }

        [self removeOldChildViewController:_childViewController];
        _childViewController = viewController;
        [self addNewChildViewController:viewController intoContainer:self.containerView];
    }
}

#pragma mark - Actions

- (IBAction)toggleMenuAction:(id)sender
{
    [self.viewOutputDelegate menuButtonPressed];
}

@end
