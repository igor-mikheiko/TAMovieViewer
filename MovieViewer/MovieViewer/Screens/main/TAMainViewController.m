//
//  TAMainViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMainViewController.h"
#import "TAMenuViewController.h"
#import "TAViewController.h"
#import "TACentralViewController.h"

@interface TAMainViewController () <TACentralViewOutputDelegate>

@property (nonatomic, strong) TACentralViewController *centralContainerViewController;

@end

@implementation TAMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Accessors

- (TACentralViewController *)centralContainerViewController
{
    if (!_centralContainerViewController) {
        _centralContainerViewController = [[TACentralViewController alloc] initWithNibName:NSStringFromClass([TACentralViewController class]) bundle:[NSBundle mainBundle]];
        _centralContainerViewController.viewOutputDelegate = self;
        [self setFrontViewController:_centralContainerViewController];
    }
    return _centralContainerViewController;
}

- (void)setMenuView:(TAMenuViewController *)menuView
{
    _menuView = menuView;
    [self setRearViewRevealWidth:CGRectGetWidth(_menuView.view.bounds)];
    [self setRearViewRevealOverdraw:10.f];
    [self setRearViewController:_menuView];
}

- (void)setCentralView:(TAViewController *)centralView
{
    _centralView = centralView;
    [self.centralContainerViewController setViewController:_centralView];
}

#pragma mark - 

- (void)menuButtonPressed
{
    [self revealToggleAnimated:YES];
}

@end
