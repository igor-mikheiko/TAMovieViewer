//
//  TAWatchlistResponseObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"

@interface TAWatchlistObject : RLMObject

@property NSString *mediaType;
@property NSInteger mediaId;
@property BOOL watchlist;

@end
