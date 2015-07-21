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

@interface TAMainViewController ()

@end

@implementation TAMainViewController

- (void)setMenuView:(TAMenuViewController *)menuView
{
    _menuView = menuView;
    [self setRearViewController:_menuView];
}

- (void)setCentralView:(TAViewController *)centralView
{
    _centralView = centralView;
    [self setFrontViewController:centralView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
