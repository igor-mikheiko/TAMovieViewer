//
//  TAMovieListItemViewModel.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModel.h"
#import "TAMovieListItemActionDelegate.h"

@class TAListItemObject;

@protocol TAMovieListItemViewDelegate <NSObject>

- (void)updateView;

@end

@interface TAMovieListItemViewModel : TAViewModel

@property (nonatomic, weak) NSObject<TAMovieListItemViewDelegate> *viewDelegate;

@property (nonatomic, weak) NSObject<TAMovieListItemActionDelegate> *actionDelegate;

@property (nonatomic, readonly) NSString *title;

- (instancetype)initWithListItem:(TAListItemObject *)listItem;

- (void)performRemoveFromList;

@end
