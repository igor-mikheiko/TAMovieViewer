//
//  TAWatchedViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAWatchedViewController.h"

@interface TAWatchedViewController ()

@end

@implementation TAWatchedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Watched Movies";
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
