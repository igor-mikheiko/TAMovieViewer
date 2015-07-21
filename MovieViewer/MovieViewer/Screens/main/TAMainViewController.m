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

@property (nonatomic, strong) UINavigationController *centralNavigationController;

@end

@implementation TAMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Accessors

- (UINavigationController *)centralNavigationController
{
    if (!_centralNavigationController) {
        _centralNavigationController = [[UINavigationController alloc] init];
    }
    return _centralNavigationController;
}

- (void)setMenuView:(TAMenuViewController *)menuView
{
    _menuView = menuView;
    [self setRearViewController:_menuView];
}

- (void)setCentralView:(TAViewController *)centralView
{
    if (_centralView) {
        [self.centralNavigationController popViewControllerAnimated:NO];
    }

    _centralView = centralView;
    [self.centralNavigationController pushViewController:centralView animated:YES];
    [self setFrontViewController:self.centralNavigationController];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(toggleMenuAction:)];
    [_centralNavigationController.navigationBar.topItem setLeftBarButtonItems:@[menuButton]];
}

#pragma mark - Actions

- (IBAction)toggleMenuAction:(id)sender
{
    [self revealToggleAnimated:YES];
}

@end
