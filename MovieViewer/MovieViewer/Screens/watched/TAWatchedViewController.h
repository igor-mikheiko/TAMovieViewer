//
//  TAWatchedViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TATableViewController.h"

@class TAWatchedViewModel;

@protocol TAWatchedViewController <NSObject>

@property (nonatomic, strong, readonly) TAWatchedViewModel<TATableViewModelProtocol> *viewModel;

@end

@interface TAWatchedViewController : TATableViewController <TAWatchedViewController>

@end
