//
//  TAFavoritesViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"

@class TAFavoritesViewModel;

@protocol TAFavoritesViewController <NSObject>

@property (nonatomic, strong, readonly) TAFavoritesViewModel *viewModel;

@end

@interface TAFavoritesViewController : TAViewController <TAFavoritesViewController>

@end
