//
//  ADViewModel.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TARouter.h"

@protocol TAViewModel <NSObject>

@property (nonatomic, weak) TARouter *router;

@optional
@property (nonatomic, weak) NSObject *viewDelegate;

@end

@interface TAViewModel : NSObject <TAViewModel>

@property (nonatomic, weak) TARouter *router;

@end
