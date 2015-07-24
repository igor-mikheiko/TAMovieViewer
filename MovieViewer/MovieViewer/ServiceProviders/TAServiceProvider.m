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
#import "TAUserAuthInfo.h"
#import "TAConstants.h"
#import "TAUserTMDBSessionObject.h"
#import "OVCResponse.h"
#import "RLMRealm.h"
#import "RLMResults.h"
#import "TADispatchManagement.h"
#import "TAErrors.h"
#import "TAWatchlistRequestParametersModel.h"
#import "TAAddWatchlistRequestModel.h"
#import "TAFavoriteListRequestParametersModel.h"
#import "TAAddFavoriteRequestModel.h"

NSString *const kParameterApiKey = @"api_key";
NSString *const kParameterUsernameKey = @"username";
NSString *const kParameterPasswordKey = @"password";
NSString *const kParameterRequestTokenKey = @"request_token";
NSString *const kParameterSessionIDKey = @"session_id";
NSString *const kParameterListPageKey = @"page";
NSString *const kParameterMediaTypeKey = @"media_type";
NSString *const kParameterMediaIdKey = @"media_id";
NSString *const kParameterWatchlistKey = @"watchlist";
NSString *const kParameterFavoriteKey = @"favorite";

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

#pragma mark - Auth
- (void)checkUser:(NSString *)username isAuthorized:(void (^)(BOOL isAuthorized))checkCompletion {
    ta_dispatch_async(^{
        BOOL userAuthorized = [self isSessionInfoAvailableForUser:username];
        BLOCK_EXEC(checkCompletion, userAuthorized);
    });
}

- (void)logoutCurrentUser {
    ta_dispatch_async(^{
        RLMRealm *realm = [RLMRealm defaultRealm];
        TAUserTMDBSessionObject *userTMDBSessionObject = [self sessionInfoForCurrentUser];
        [realm beginWriteTransaction];
        [realm deleteObject:userTMDBSessionObject];
        [realm commitWriteTransaction];
    });
}

- (void)validateUserAuthInfo:(TAUserAuthInfo *)userAuthModel withSuccessBlock:(void (^)())successBlock andErrorBlock:(void (^)(NSError *))errorBlock {
    TAUserTMDBSessionObject *userTMDBSessionObject = [self sessionInfoForCurrentUser];
    if (userTMDBSessionObject) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObject:userTMDBSessionObject];
        [realm commitWriteTransaction];
    }

    TAUserTMDBSessionObject *newSessionObject = [TAUserTMDBSessionObject new];
    newSessionObject.username = userAuthModel.login;

    // request token for validation
    [self generateValidTokenWithSuccessBlock:^(TANewTokenResponseModel *model) {
        newSessionObject.authToken = model.requestToken;

        // validate user data with token, get token for new session
        [self validateUser:userAuthModel withToken:model.requestToken withSuccessBlock:^(TAValidateResponseModel *validationModel) {
            newSessionObject.sessionToken = validationModel.requestToken;

            // create new session
            [self createNewSessionWithSessionToken:validationModel.requestToken successBlock:^(TANewSessionResponseModel *model) {
                newSessionObject.sessionId = model.sessionId;
                ta_dispatch_main_queue(^{
                    [self saveToRealmSessionObject:newSessionObject];
                    NSLog(@"success");
                    BLOCK_EXEC(successBlock);
                });
            } andErrorBlock:^(NSError *error) {
                BLOCK_EXEC(errorBlock, error);
            }];

        } andErrorBlock:^(NSError *error) {
            BLOCK_EXEC(errorBlock, error);
        }];

    } andErrorBlock:^(NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

#pragma mark - Discover
- (void)getDiscoverMoviesWithParameters:(TADiscoverRequestParametersModel *)parameters
                            withSuccess:(void (^)(TADiscoverResponseModel *discoveryObject))success
                               andError:(void (^)(NSError *error))errorBlock {

    TAUserTMDBSessionObject *currentSessionInfo = [self sessionInfoForCurrentUser];
    if (![currentSessionInfo sessionId]){
        NSError *error = [NSError errorWithDomain:TAMakeAppDomain(TAServiceProviderError) code:401 userInfo:nil];
        BLOCK_EXEC(errorBlock,error);
    }

    NSDictionary *getParams = @{
            kParameterApiKey: TATMDBApiKey
    };

    [self GET:TADiscoverMovie parameters:getParams success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TADiscoverResponseModel *responseModel = responseObject.result;
        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

#pragma mark - Favorite
- (void)getFavoriteMoviesWithParameters:(TAFavoriteListRequestParametersModel *)parameters
                            withSuccess:(void (^)(TAListResponseModel *moviesListObject))success
                               andError:(void (^)(NSError *error))errorBlock {
    TAUserTMDBSessionObject *currentSessionInfo = [self sessionInfoForCurrentUser];
    if (![currentSessionInfo sessionId]){
        NSError *error = [NSError errorWithDomain:TAMakeAppDomain(TAServiceProviderError) code:401 userInfo:nil];
        BLOCK_EXEC(errorBlock,error);
    }

    NSDictionary *reqParameters = @{
            kParameterApiKey: TATMDBApiKey,
            kParameterSessionIDKey : currentSessionInfo.sessionId,
            kParameterListPageKey : @(parameters.page)
    };

    [self GET:TAAccountFavoriteMovies parameters:reqParameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TAListResponseModel *responseModel = responseObject.result;

        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

- (void)postToFavoriteMovieWithParameters:(TAAddFavoriteRequestModel *)parameters
                              withSuccess:(void (^)(TAListChangedResponseModel *favoritesChangedObject))success
                            andErrorBlock:(void (^)(NSError *error))errorBlock {

    TAUserTMDBSessionObject *currentSessionInfo = [self sessionInfoForCurrentUser];
    if (![currentSessionInfo sessionId]){
        NSError *error = [NSError errorWithDomain:TAMakeAppDomain(TAServiceProviderError) code:401 userInfo:nil];
        BLOCK_EXEC(errorBlock,error);
    }

    NSDictionary *postParameters = @{
            kParameterApiKey: TATMDBApiKey,
            kParameterSessionIDKey : currentSessionInfo.sessionId,
            kParameterMediaTypeKey : @"movie",
            kParameterMediaIdKey: @(parameters.mediaId),
            kParameterFavoriteKey: parameters.favorite ? @"true" : @"false"
    };

    [self POST:TAAccountChangeFavorite parameters:postParameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TAListChangedResponseModel *responseModel = responseObject.result;

        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

#pragma mark - Watchlist
- (void)getWatchlistWithParameters:(TAWatchlistRequestParametersModel *)parameters
                       withSuccess:(void (^)(TAListResponseModel *))success
                     andErrorBlock:(void (^)(NSError *))errorBlock {

    TAUserTMDBSessionObject *currentSessionInfo = [self sessionInfoForCurrentUser];
    if (![currentSessionInfo sessionId]){
        NSError *error = [NSError errorWithDomain:TAMakeAppDomain(TAServiceProviderError) code:401 userInfo:nil];
        BLOCK_EXEC(errorBlock,error);
    }

    NSDictionary *reqParameters = @{
            kParameterApiKey: TATMDBApiKey,
            kParameterSessionIDKey : currentSessionInfo.sessionId,
            kParameterListPageKey : @(parameters.page)
    };

    [self GET:TAAccountWatchlistMovies parameters:reqParameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TAListResponseModel *responseModel = responseObject.result;

        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

- (void)postToWatchlistMovieWithParameters:(TAAddWatchlistRequestModel *)parameters
                               withSuccess:(void (^)(TAListChangedResponseModel *watchlistChangedObject))success
                             andErrorBlock:(void (^)(NSError *error))errorBlock {
    TAUserTMDBSessionObject *currentSessionInfo = [self sessionInfoForCurrentUser];
    if (![currentSessionInfo sessionId]){
        NSError *error = [NSError errorWithDomain:TAMakeAppDomain(TAServiceProviderError) code:401 userInfo:nil];
        BLOCK_EXEC(errorBlock,error);
    }

    NSDictionary *postParameters = @{
            kParameterApiKey: TATMDBApiKey,
            kParameterSessionIDKey : currentSessionInfo.sessionId,
            kParameterMediaTypeKey : @"movie",
            kParameterMediaIdKey: @(parameters.mediaId),
            kParameterWatchlistKey: parameters.watchlist ? @"true" : @"false"
    };

    [self POST:TAAccountChangeWatchlist parameters:postParameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TAListChangedResponseModel *responseModel = responseObject.result;
        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

#pragma mark - Internal
- (BOOL) isSessionInfoAvailableForUser: (NSString *) username{
    TAUserTMDBSessionObject *userTMDBSessionObject = [self sessionInfoForUserWithName:username];
    if ([userTMDBSessionObject sessionId]){
        return YES;
    }

    return NO;
}

- (TAUserTMDBSessionObject *) sessionInfoForUserWithName: (NSString *) username{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username = %@",username];
    RLMResults *results = [TAUserTMDBSessionObject objectsWithPredicate:predicate];
    TAUserTMDBSessionObject *userTMDBSessionObject = [results firstObject];
    return userTMDBSessionObject;
}

- (TAUserTMDBSessionObject *) sessionInfoForCurrentUser{
    RLMResults *results = [TAUserTMDBSessionObject allObjects];
    TAUserTMDBSessionObject *userTMDBSessionObject = [results firstObject]; //only one session object is saved
    return userTMDBSessionObject;
}

- (void) saveToRealmSessionObject: (TAUserTMDBSessionObject *) sessionObject{
    RLMResults *results = [TAUserTMDBSessionObject allObjects];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObjects:results];      // remove all saved session objects
    [realm addObject:sessionObject];
    [realm commitWriteTransaction];
}

- (void)generateValidTokenWithSuccessBlock:(void (^)(TANewTokenResponseModel *))success andErrorBlock:(void (^)(NSError *))errorBlock {
    NSDictionary *parameters = @{kParameterApiKey: TATMDBApiKey};
    [self GET:TAAuthTokenNew parameters:parameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TANewTokenResponseModel *responseModel = responseObject.result;
        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

- (void) validateUser: (TAUserAuthInfo *)userAuthModel
            withToken: (NSString *) reqToken
     withSuccessBlock:(void (^)(TAValidateResponseModel *validationModel))successBlock
        andErrorBlock:(void (^)(NSError *))errorBlock {

    NSDictionary *parameters = @{
            kParameterApiKey: TATMDBApiKey,
            kParameterRequestTokenKey: reqToken,
            kParameterUsernameKey: userAuthModel.login,
            kParameterPasswordKey: userAuthModel.password
    };

    [self GET:TAAuthValidateLogin parameters:parameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TAValidateResponseModel *responseModel = responseObject.result;

        BLOCK_EXEC(successBlock, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}

- (void) createNewSessionWithSessionToken: (NSString *) sessionToken
                             successBlock:(void (^)(TANewSessionResponseModel *))success
                            andErrorBlock:(void (^)(NSError *))errorBlock{

    NSDictionary *parameters = @{
            kParameterApiKey: TATMDBApiKey,
            kParameterRequestTokenKey: sessionToken};

    // get new session id
    [self GET:TAAuthSessionNew parameters:parameters success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
        TANewSessionResponseModel *responseModel = responseObject.result;

        BLOCK_EXEC(success, responseModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        BLOCK_EXEC(errorBlock, error);
    }];
}
@end