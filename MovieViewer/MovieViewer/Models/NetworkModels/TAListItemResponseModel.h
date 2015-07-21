//
//  TAListItemResponseModel.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TAListItemResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *backdropPath;
@property (nonatomic) NSInteger itemId;
@property (nonatomic, strong) NSString *originalTitle;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) float voteAverage;
@property (nonatomic) NSInteger voteCount;

@end
