//
//  TAFavoriteItemObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TAListItemObject : RLMObject <MTLJSONSerializing>

@property NSString *backdropPath;
@property NSInteger itemId;
@property NSString *originalTitle;
@property NSDate *releaseDate;
@property NSString *posterPath;
@property NSString *title;
@property float voteAverage;
@property NSInteger voteCount;

@end

RLM_ARRAY_TYPE(TAFavoriteItemObject)
