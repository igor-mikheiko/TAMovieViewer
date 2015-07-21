//
//  TADiscoveryViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TADiscoveryViewController.h"
#import <UIScrollView+InfiniteScroll.h>
#import "TAMovieCell.h"

static NSString *const kMovieCellIdentifier = @"TAMovieCellId";

@interface TADiscoveryViewController ()

@end

@implementation TADiscoveryViewController

- (void)viewDidLoad
{
    [self.tableView registerClass:[TAMovieCell class] forCellReuseIdentifier:kMovieCellIdentifier];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Discovery";
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TAMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:kMovieCellIdentifier];
    [cell bindWithModel:self.data[indexPath.row]];
    
    return cell;
}

@end
