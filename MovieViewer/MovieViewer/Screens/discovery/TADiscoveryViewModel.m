//
//  TADiscoveryViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TADiscoveryViewModel.h"
#import "TADiscoveryFacade.h"
#import "TADiscoveryMovieActionDelegate.h"
#import "TADiscoveryMovieViewModel.h"

@interface TADiscoveryViewModel () <TADiscoveryMovieActionDelegate>

@end

@implementation TADiscoveryViewModel {
    NSUInteger _currentPage;
}
@synthesize viewDelegate;

- (void)fetchNextData
{
    [self.facade getMoviesOnPage:(_currentPage + 1) success:^(NSArray *movies) {
        ++_currentPage;

        NSMutableArray *newData = [NSMutableArray arrayWithCapacity:movies.count];
        for (TADiscoverItemObject *discoveryItem in movies) {
            TADiscoveryMovieViewModel *itemViewModel = [[TADiscoveryMovieViewModel alloc] initWithDiscovery:discoveryItem];
            itemViewModel.actionDelegate = self;
            [newData addObject:itemViewModel];
        }
        _fetchedData = [_fetchedData ?: @[] arrayByAddingObjectsFromArray:newData];

        [self.viewDelegate tableViewModel:self didFetchNextData:newData];
    } failure:^(NSError *error) {
        [self.viewDelegate tableViewModel:self didFail:error];
    }];
}

#pragma mark - TADiscoveryMovieActionDelegate

- (void)performAddFavoriteDiscoveryViewModel:(TADiscoveryMovieViewModel *)viewModel
{
    [viewModel.viewDelegate updateView];
}

- (void)performRemoveFavoriteDiscoveryViewModel:(TADiscoveryMovieViewModel *)viewModel
{
    [viewModel.viewDelegate updateView];
}

- (void)performAddWatchedDiscoveryViewModel:(TADiscoveryMovieViewModel *)viewModel
{
    [viewModel.viewDelegate updateView];
}

- (void)performRemoveWatchedDiscoveryViewModel:(TADiscoveryMovieViewModel *)viewModel
{
    [viewModel.viewDelegate updateView];
}

@end
