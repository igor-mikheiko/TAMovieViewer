//
//  TACentralViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TACentralViewOutputDelegate <NSObject>

- (void)menuButtonPressed;

@end

@interface TACentralViewController : UIViewController

@property (nonatomic, weak) NSObject<TACentralViewOutputDelegate> *viewOutputDelegate;

- (void)setViewController:(UIViewController *)viewController;

@end
