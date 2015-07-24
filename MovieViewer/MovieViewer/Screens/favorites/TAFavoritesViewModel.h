//
//  TAFavoritesViewModel.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModel.h"
#import "TATableViewModelProtocol.h"

@class TAFavoritesMoviesFacade;

@interface TAFavoritesViewModel : TAViewModel <TATableViewModelProtocol>

@property (nonatomic, strong) TAFavoritesMoviesFacade *facade;

@property (nonatomic, strong, readonly) NSArray *fetchedData;

@end
