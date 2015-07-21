//
//  TAMenuViewModel.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewModel.h"

@interface TAMenuViewModel : TAViewModel

- (void)performShowDiscovery;

- (void)performShowFavorites;

- (void)performShowWatched;

- (void)performLogOutAction;

@end
