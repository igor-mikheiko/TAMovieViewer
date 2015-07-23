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

    if ([self.loginFacade isAlreadyAuthenticated]) {
        TAFavoriteListRequestParametersModel *parameters = [TAFavoriteListRequestParametersModel new];
        parameters.page = page;
        [self.serviceProvider getFavoriteMoviesWithParameters:parameters withSuccess:^(TAListResponseModel *response) {
            _totalPages = response.totalPages;
            BLOCK_EXEC(success, response.results);
        } andError:^(NSError *error) {
            NSError *facadeError = [NSError errorWithUnderlyingError:error domain:TAMakeAppDomain(TAFavoritesMoviesFacadeError) code:1 userInfo:nil];
            BLOCK_EXEC(failure, facadeError)
        }];
    } else {
        //TODO: handle
    }
}

@end
