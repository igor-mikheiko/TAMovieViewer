//
//  TAWatchedViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"

@class TAWatchedViewModel;

@protocol TAWatchedViewController <NSObject>

@property (nonatomic, strong, readonly) TAWatchedViewModel *viewModel;

@end

@interface TAWatchedViewController : TAViewController <TAWatchedViewController>

@end
