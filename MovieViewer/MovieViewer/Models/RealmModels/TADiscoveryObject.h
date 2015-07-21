//
//  TADiscoveryResponceObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"
#import "RLMArray.h"
#import "TADiscoverItemObject.h"

@interface TADiscoveryObject : RLMObject

@property NSUInteger page;
@property RLMArray <TADiscoverItemObject> *results;
@property NSUInteger totalPages;
@property NSUInteger totalResults;

@end
