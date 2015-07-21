//
//  TAFavoriteResponseObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"
#import "TAListItemObject.h"
#import "RLMArray.h"

@interface TAListResponseObject : RLMObject

@property NSUInteger page;
@property RLMArray <TAFavoriteItemObject> *results;
@property NSUInteger totalPages;
@property NSUInteger totalResults;

@end
