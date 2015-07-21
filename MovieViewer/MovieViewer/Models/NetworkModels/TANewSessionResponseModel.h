//
//  TANewSessionResponseObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/MTLJSONAdapter.h>

@interface TANewSessionResponseModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *sessionId;
@property (nonatomic) BOOL success;

@end
