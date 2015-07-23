//
//  TAMovieCell.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TACellModelBindingProtocol.h"
#import "TADiscoverItemObject.h"

@interface TAMovieCell : UITableViewCell <TACellModelBindingProtocol>

- (void)bindWithModel:(TADiscoverItemObject *)model;

@end
