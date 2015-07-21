//
//  TAServiceProvider.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAServiceProvider.h"
#import "TAServiceRoutes.h"
#import "TANewTokenResponseModel.h"
#import "TAValidateResponseModel.h"
#import "TANewSessionResponseModel.h"
#import "TADiscoverResponseModel.h"
#import "TAListResponseModel.h"
#import "TAListChangedResponseModel.h"

@implementation TAServiceProvider

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:TABaseServicePath]];
    if (self) {
    }
    return self;
}

+ (NSDictionary *)modelClassesByResourcePath{
    return @{
             TAAuthTokenNew : [TANewTokenResponseModel class],
             TAAuthValidateLogin : [TAValidateResponseModel class],
             TAAuthSessionNew : [TANewSessionResponseModel class],
             
             TADiscoverMovie : [TADiscoverResponseModel class],
             
             TAAccountFavoriteMovies : [TAListResponseModel class],
             TAAccountChangeFavorite : [TAListChangedResponseModel class],
             
             TAAccountWatchlistMovies : [TAListResponseModel class],
             TAAccountChangeWatchlist : [TAListChangedResponseModel class]
             };
}

@end
