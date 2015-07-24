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

@property NSInteger page;
@property RLMArray <TAListItemObject> *results;
@property NSInteger totalPages;
@property NSInteger totalResults;

@end
