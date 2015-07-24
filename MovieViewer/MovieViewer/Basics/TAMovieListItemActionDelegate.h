//
//  TAMovieListItemActionDelegate.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TAMovieListItemActionDelegate <NSObject>

@optional

- (void)performRemoveListItemViewModel:(id)viewModel;

@end
