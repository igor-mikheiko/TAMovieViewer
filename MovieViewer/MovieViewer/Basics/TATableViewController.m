//
//  TATableViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TATableViewController.h"
#import <UIScrollView+InfiniteScroll.h>

NSString *const TATableViewControllerNibName = @"TATableViewController";

@interface TATableViewController () <TATableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *data;

@end

@implementation TATableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.infiniteScrollIndicatorStyle = UIActivityIndicatorViewStyleWhite;
    [self.tableView addInfiniteScrollWithHandler:^(id scrollView) {
        [self.viewModel fetchNextData];
    }];

    self.data = self.viewModel.fetchedData;
    [self.tableView reloadData];
}

#pragma mark -

- (void)tableViewModel:(NSObject<TATableViewModelProtocol> *)tableViewModel didFetchNextData:(NSArray *)nextData
{
    if ([nextData count] > 0) {
        _data = [(_data ?: @[]) arrayByAddingObjectsFromArray:nextData];
        NSMutableArray *insertIndices = [NSMutableArray arrayWithCapacity:[nextData count]];
        const NSUInteger startIndex = [self.data count];
        [nextData enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(startIndex + idx) inSection:0];
            [insertIndices addObject:indexPath];
        }];

        [self.tableView insertRowsAtIndexPaths:insertIndices withRowAnimation:UITableViewRowAnimationNone];
    }

    [self.tableView finishInfiniteScroll];
}

- (void)tableViewModel:(NSObject<TATableViewModelProtocol> *)tableViewModel didFail:(NSError *)error
{
    //TODO: handle error while fetching
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
