//
//  TAWatchedViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAWatchedViewModel.h"

@implementation TAWatchedViewModel

- (void)fetchNextData
{
    NSArray *newData = @[];
    _fetchedData = [_fetchedData ?: @[] arrayByAddingObjectsFromArray:newData];

    [self.viewDelegate tableViewModel:self didFetchNextData:newData];
}

@end
