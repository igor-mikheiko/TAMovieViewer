//
//  TAServiceProvider.h
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "OVCHTTPSessionManager.h"
@class TANewTokenResponseModel;
@class TAUserAuthInfo;
@class TAValidateResponseModel;
@class TANewSessionResponseModel;
@class TADiscoverRequestParametersModel;
@class TAFavoriteListRequestParametersModel;
@class TADiscoverResponseModel;
@class TAListResponseModel;
@class TAWatchlistRequestParametersModel;
@class TAAddWatchlistRequestModel;
@class TAListChangedResponseModel;
@class TAAddFavoriteRequestModel;

@interface TAServiceProvider : OVCHTTPSessionManager

- (void) checkUser: (NSString *)username isAuthorized: (void (^)(BOOL isAuthorized)) checkCompletion;

- (void) logoutCurrentUser;

- (void) validateUserAuthInfo: (TAUserAuthInfo *) userAuthModel
             withSuccessBlock: (void (^) ()) success
                andErrorBlock: (void (^) (NSError *)) errorBlock;

- (void) getDiscoverMoviesWithParameters: (TADiscoverRequestParametersModel *) parameters
                             withSuccess: (void (^) (TADiscoverResponseModel *discoveryObject)) success
                                andError: (void (^)(NSError *error)) errorBlock;

- (void) getFavoriteMoviesWithParameters: (TAFavoriteListRequestParametersModel *) parameters
                             withSuccess: (void (^)(TAListResponseModel *moviesListObject)) success
                                andError: (void (^)(NSError *error)) errorBlock;

- (void) getWatchlistWithParameters: (TAWatchlistRequestParametersModel *) parameters
                        withSuccess: (void (^)(TAListResponseModel *moviesListObject)) success
                      andErrorBlock: (void (^)(NSError *error)) errorBlock;

- (void) postToWatchlistMovieWithParameters: (TAAddWatchlistRequestModel *) parameters
                                withSuccess: (void (^)(TAListChangedResponseModel *watchlistChangedObject)) success
                              andErrorBlock: (void (^)(NSError *error)) errorBlock;

- (void) postToFavoriteMovieWithParameters: (TAAddFavoriteRequestModel *) parameters
                               withSuccess: (void (^)(TAListChangedResponseModel *favoritesChangedObject)) success
                             andErrorBlock: (void (^)(NSError *error)) errorBlock;
@end
