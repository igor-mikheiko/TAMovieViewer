//
//  TADiscoveryFacade.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/23/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TADiscoveryFacade.h"
#import "TALoginFacade.h"
#import "TAErrors.h"
#import "TAConstants.h"
#import "TADiscoverRequestParametersModel.h"
#import "TADiscoveryObject.h"

static NSUInteger const kTotalPagesUndefined = NSUIntegerMax;

@implementation TADiscoveryFacade {
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

- (void)getMoviesOnPage:(NSUInteger)page success:(ta_facade_movies_success_block)success failure:(ta_facade_movies_failure_block)failure
{
    if (_totalPages != kTotalPagesUndefined && page >= _totalPages) {
        BLOCK_EXEC(success, nil)
        return;
    }

    TADiscoverRequestParametersModel *parameters = [TADiscoverRequestParametersModel new];
    parameters.page = page;
    [self.serviceProvider getDiscoverMoviesWithParameters:parameters withSuccess:^(TADiscoveryObject *response) {
        _totalPages = response.totalPages;
        BLOCK_EXEC(success, response.results);
    } andError:^(NSError *error) {
        NSError* facadeError = [NSError errorWithUnderlyingError:error domain:TAMakeAppDomain(TADiscoveryFacadeError) code:1 userInfo:nil];
        BLOCK_EXEC(failure, facadeError);
    }];
}

@end
