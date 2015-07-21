//
//  TAMainViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <SWRevealViewController/SWRevealViewController.h>

@class TAViewController,
TAMenuViewController;

@interface TAMainViewController : SWRevealViewController

@property (nonatomic, strong) TAMenuViewController *menuView;

@property (nonatomic, strong) TAViewController *centralView;

@end
