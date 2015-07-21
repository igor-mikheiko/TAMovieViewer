//
//  TADiscoverItemResponseModel.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TADiscoverItemResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic) BOOL adult;
@property (nonatomic) NSString *backdropPath;
@property (nonatomic) NSArray *genreIDs;
@property (nonatomic) NSInteger itemID;
@property (nonatomic) NSString *originalLanguage;
@property (nonatomic) NSString *originalTitle;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSDate *releaseDate;
@property (nonatomic) NSString *posterPath;
@property (nonatomic) float popularity;
@property (nonatomic) NSString *title;
@property (nonatomic) BOOL video;
@property (nonatomic) float voteAverage;
@property (nonatomic) NSInteger voteCount;

@end
