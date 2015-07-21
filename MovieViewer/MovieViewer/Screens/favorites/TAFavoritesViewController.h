//
//  TAFavoritesViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"
#import "TATableViewController.h"

@class TAFavoritesViewModel;

@protocol TAFavoritesViewController <NSObject>

@property (nonatomic, strong, readonly) TAFavoritesViewModel<TATableViewModelProtocol> *viewModel;

@end

@interface TAFavoritesViewController : TATableViewController <TAFavoritesViewController>

@end
