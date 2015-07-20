//
//  TALoginViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"

@class TALoginViewModel;

@protocol TALoginView <NSObject>

@property (nonatomic, strong, readonly) TALoginViewModel *viewModel;

@end

@interface TALoginViewController : TAViewController <TALoginView>

@end
