//
//  TADiscoverItemObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"
#import "TAIntegerObject.h"

@interface TADiscoverItemObject : RLMObject

@property BOOL adult;
@property NSString *backDropPath;
@property RLMArray <TAIntegerObject> *genreIDs;
@property NSInteger itemID;
@property NSString *originalLanguage;
@property NSString *originalTitle;
@property NSString *overview;
@property NSDate *releaseDate;
@property NSString *posterPath;
@property float popularity;
@property NSString *title;
@property BOOL video;
@property float voteAverage;
@property NSInteger vodeCount;

@end

RLM_ARRAY_TYPE(TADiscoverItemObject)
