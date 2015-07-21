//
//  TAMenuViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"

@class TAMenuViewModel;

@protocol TAMenuViewController <NSObject>

@property (nonatomic, strong, readonly) TAMenuViewModel *viewModel;

@end

@interface TAMenuViewController : TAViewController <TAMenuViewController>

@end
