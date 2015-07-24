//
//  TAAddFavoriteAction.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAAddFavoriteAction.h"
#import "TAAddFavoriteRequestModel.h"

@implementation TAAddFavoriteAction

- (void)do:(void (^)(BOOL))completion
{
    TAAddFavoriteRequestModel *requestModel = [TAAddFavoriteRequestModel new];
    requestModel.mediaId = self.listItem.itemId;
    requestModel.favorite = YES;
    [self.serviceProvider postToFavoriteMovieWithParameters:requestModel withSuccess:^(TAListChangedResponseModel *favoritesChangedObject) {

    } andErrorBlock:^(NSError *error) {

    }];
}

@end
