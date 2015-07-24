//
//  TAFavoritesMoviesFacade.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAFavoritesMoviesFacade.h"
#import "TALoginFacade.h"
#import "TAFavoriteListRequestParametersModel.h"
#import "TAListResponseModel.h"
#import "TAErrors.h"
#import "TAConstants.h"
#import <Realm/Realm.h>
#import "TADispatchManagement.h"
#import "TAListItemObject.h"
#import "TACollectionPaginator.h"

static NSUInteger const kTotalPagesUndefined = NSUIntegerMax;

@implementation TAFavoritesMoviesFacade {
    NSUInteger _totalPages;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _totalPages = kTotalPagesUndefined;
    }
    return self;
}

- (void)getMoviesOnPage:(NSUInteger)page success:(ta_facade_favorites_success_block)success failure:(ta_facade_favorites_failure_block)failure
{
    if (_totalPages != kTotalPagesUndefined && page >= _totalPages) {
        BLOCK_EXEC(success, nil)
        return;
    }

    if (self.serviceProvider.reachabilityManager.isReachable) {
        TAFavoriteListRequestParametersModel *parameters = [TAFavoriteListRequestParametersModel new];
        parameters.page = page;
        [self.serviceProvider getFavoriteMoviesWithParameters:parameters withSuccess:^(TAListResponseModel *response) {
            _totalPages = response.totalPages;

            ta_dispatch_async(^{
                RLMRealm *storage = [RLMRealm defaultRealm];
                TAUserProfile *user = self.loginFacade.user;
                [storage beginWriteTransaction];
                [user.watchedList addObjects:response.results];
                [TAUserProfile createOrUpdateInRealm:storage withValue:user];
                [storage commitWriteTransaction];
            });

            BLOCK_EXEC(success, response.results);
        } andError:^(NSError *error) {
            //todo: handle service unavailable situation
            NSError *facadeError = [NSError errorWithUnderlyingError:error domain:TAMakeAppDomain(TAFavoritesMoviesFacadeError) code:1 userInfo:nil];
            BLOCK_EXEC(failure, facadeError)
        }];
    } else {
        ta_dispatch_main_queue(^{
            RLMRealm *storage = [RLMRealm defaultRealm];
            TAUserProfile *user = [TAUserProfile objectInRealm:storage forPrimaryKey:self.loginFacade.user.username];
            RLMArray *favorites = user.favoritesList;
            NSArray *paginatedResults = [TACollectionPaginator collectionArray:favorites atPage:page size:self.pageSize];
            BLOCK_EXEC(success, paginatedResults);
        });
    }
}

@end
