//
//  TAValidateResponseObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TAValidateResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *requestToken;
@property (nonatomic) BOOL success;

@end
