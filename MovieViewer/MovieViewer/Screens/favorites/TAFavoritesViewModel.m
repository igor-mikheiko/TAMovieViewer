//
//  TAFavoritesViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAFavoritesViewModel.h"
#import "TAFavoritesMoviesFacade.h"
#import "TAMovieListItemViewModel.h"
#import "TAListItemObject.h"

@interface TAFavoritesViewModel () <TAMovieListItemActionDelegate>

@end

@implementation TAFavoritesViewModel {
    NSUInteger _currentPage;
}

- (void)fetchNextData
{
    [self.facade getMoviesOnPage:(_currentPage + 1) success:^(NSArray *movies) {
        ++_currentPage;

        NSMutableArray *newData = [NSMutableArray arrayWithCapacity:movies.count];
        for (TAListItemObject *listItem in movies) {
            TAMovieListItemViewModel *itemViewModel = [[TAMovieListItemViewModel alloc] initWithListItem:listItem];
            itemViewModel.actionDelegate = self;
            [newData addObject:itemViewModel];
        }
        _fetchedData = [_fetchedData ?: @[] arrayByAddingObjectsFromArray:newData];

        [self.viewDelegate tableViewModel:self didFetchNextData:newData];

    } failure:^(NSError *error) {
        [self.viewDelegate tableViewModel:self didFail:error];
    }];
}

#pragma mark - TAMovieListItemActionDelegate

- (void)performRemoveListItemViewModel:(TAMovieListItemViewModel *)viewModel
{
    [viewModel.viewDelegate updateView];
}

@end
