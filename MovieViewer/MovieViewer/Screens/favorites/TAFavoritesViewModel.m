//
//  TAFavoritesViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAFavoritesViewModel.h"

@implementation TAFavoritesViewModel

- (void)fetchNextData
{
    NSArray *newData = @[];
    _fetchedData = [_fetchedData ?: @[] arrayByAddingObjectsFromArray:newData];

    [self.viewDelegate tableViewModel:self didFetchNextData:newData];
}

@end
