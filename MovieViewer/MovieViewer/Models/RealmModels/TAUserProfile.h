//
//  TAUserProfile.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"
#import <Realm/RLMArray.h>
#import "TAListItemObject.h"

@protocol TAFavoriteListItemObject,
TAWatchedListItemObject;

@interface TAUserProfile : RLMObject

@property NSString *username;

@property RLMArray<TAFavoriteListItemObject> *favoritesList;

@property RLMArray<TAWatchedListItemObject> *watchedList;

@end
