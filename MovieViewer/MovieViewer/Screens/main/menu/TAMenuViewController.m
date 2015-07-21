//
//  TAMenuViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMenuViewController.h"
#import "TAMenuViewModel.h"

@interface TAMenuViewController ()

@end

@implementation TAMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)discoverMenuAction:(id)sender
{
    [self.viewModel performShowDiscovery];
}

- (IBAction)favoritesMenuAction:(id)sender
{
    [self.viewModel performShowFavorites];
}

- (IBAction)watchedMenuAction:(id)sender
{
    [self.viewModel performShowWatched];
}

- (IBAction)logoutMenuAction:(id)sender
{
    [self.viewModel performLogOutAction];
}

@end
