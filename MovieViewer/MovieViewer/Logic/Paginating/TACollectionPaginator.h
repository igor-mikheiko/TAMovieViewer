//
//  TACollectionPaginator.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TACollectionPaginator : NSObject

+ (NSArray *)collectionArray:(id)collection atPage:(NSUInteger const)page size:(NSUInteger const)pageSize;

@end
