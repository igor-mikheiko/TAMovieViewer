
//
//  TACollectionPaginator.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TACollectionPaginator.h"

@implementation TACollectionPaginator

+ (NSArray *)collectionArray:(id)collection atPage:(NSUInteger const)page size:(NSUInteger const)pageSize
{
    const NSUInteger startIndex = page * pageSize;
    const NSUInteger endIndex = (page + 1) * pageSize - 1;
    NSMutableArray *paginatedResults = [NSMutableArray arrayWithCapacity:pageSize];
    for (NSUInteger idx = startIndex; idx < [collection count] && idx <= endIndex; ++idx) {
        [paginatedResults addObject:[collection objectAtIndex:idx]];
    }
    return [NSArray arrayWithArray:paginatedResults];
}

@end
