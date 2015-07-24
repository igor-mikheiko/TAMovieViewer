//
//  TAMovieListItemActionObject.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"
#import "TAListItemObject.h"
#import <Realm/RLMArray.h>

typedef NS_ENUM(NSInteger, TAListAction) {
    TAListActionRemove,
    TAListActionAdd
};

typedef NSString TAListType;

FOUNDATION_EXPORT TAListType *const TAFavoriteListType;
FOUNDATION_EXPORT TAListType *const TAWatchedListType;

@interface TAMovieListItemActionObject : RLMObject

@property RLMArray<TAListItemObject> *targetObjects;

@property TAListAction action;

@property TAListType *type;

@end
