//
//  TAFavoriteResponseModel.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TAListChangedResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic) NSInteger statusCode;
@property (nonatomic) NSString *statusMessage;

@end
