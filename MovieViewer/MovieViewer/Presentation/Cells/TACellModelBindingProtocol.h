//
//  TACellModelBindingProtocol.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TACellModelBindingProtocol <NSObject>

- (void)bindWithModel:(NSObject *)model;

@end
