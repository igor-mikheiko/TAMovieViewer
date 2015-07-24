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

- (void) checkUser: (NSString *)username idAuthorized: (void (^)(BOOL isAuthorized)) checkComplition;

- (void) logoutCurrentUser;

- (void) generateValidTokenWithSuccessBlock: (void  (^)(TANewTokenResponseModel *)) success
                              andErrorBlock: (void (^) (NSError *)) errorBlock;

- (void) validateUserAuthInfo: (TAUserAuthInfo *) userAuthModel
             withSuccessBlock: (void (^)(TAValidateResponseModel *)) success
                andErrorBlock: (void (^) (NSError *)) errorBlock;

- (void) createNewSessionWithSuccessBlock: (void (^)(TANewSessionResponseModel *)) success
                            andErrorBlock: (void (^) (NSError *)) errorBlock;

- (void) getDiscoverMoviesWithParameters: (TADiscoverRequestParametersModel *) parameters
                             withSuccess: (void (^) (TADiscoverResponseModel *)) success
                                andError: (void (^)(NSError *)) errorBlock;

- (void) getFavoriteMoviesWithParameters: (TAFavoriteListRequestParametersModel *) parameters
                             withSuccess: (void (^)(TAListResponseModel *)) success
                                andError: (void (^)(NSError *)) errorBlock;

- (void) getWatchlistWithParameters: (TAWatchlistRequestParametersModel *) parameters
                        withSuccess: (void (^)(TAListResponseModel *)) success
                      andErrorBlock: (void (^)(NSError *)) errorBlock;

- (void) postToWatchlistMovieWithParameters: (TAAddWatchlistRequestModel *) parameters
                                withSuccess: (void (^)(TAListChangedResponseModel *)) success
                              andErrorBlock: (void (^)(NSError *)) errorBlock;

- (void) postToFavoriteMovieWithParameters: (TAAddFavoriteRequestModel *) parameters
                               withSuccess: (void (^)(TAListChangedResponseModel *)) success
                             andErrorBlock: (void (^)(NSError *)) errorBlock;
@end
