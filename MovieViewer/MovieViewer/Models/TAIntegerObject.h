//
//  TAIntegerObject.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/20/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RLMObject.h"

@interface TAIntegerObject : RLMObject

@property NSInteger value;

@end

RLM_ARRAY_TYPE(TAIntegerObject)
