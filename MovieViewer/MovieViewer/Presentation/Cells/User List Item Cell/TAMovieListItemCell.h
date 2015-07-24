//
//  TAMovieListItemCell.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TACellModelBindingProtocol.h"
#import "TAMovieListItemViewModel.h"

@interface TAMovieListItemCell : UITableViewCell <TACellModelBindingProtocol, TAMovieListItemViewDelegate>

- (void)bindWithModel:(TAMovieListItemViewModel *)model

@end
