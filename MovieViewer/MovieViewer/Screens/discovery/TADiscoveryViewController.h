//
//  TADiscoveryViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"

@class TADiscoveryViewModel;

@protocol TADiscoveryViewController <NSObject>

@property (nonatomic, strong, readonly) TADiscoveryViewModel *viewModel;

@end

@interface TADiscoveryViewController : TAViewController <TADiscoveryViewController>

@end
