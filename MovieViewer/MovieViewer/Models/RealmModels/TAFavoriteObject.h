//
//  TAFavoriteResponse.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"

@interface TAFavoriteObject : RLMObject

@property NSString *mediaType;
@property NSInteger *mediaID;
@property BOOL favorite;

@end
