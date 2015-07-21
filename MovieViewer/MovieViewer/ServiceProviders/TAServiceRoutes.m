//
//  TAServiceRoutes.m
//  MovieViewer
//
//  Created by Uladzimir Predka on 7/21/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "TAServiceRoutes.h"

NSString *const TABaseServicePath = @"http://api.themoviedb.org/3";

NSString *const TAAuthTokenNew = @"authentication/token/new";
NSString *const TAAuthValidateLogin = @"authentication/token/validate_with_login";
NSString *const TAAuthSessionNew = @"authentication/session/new";

NSString *const TADiscoverMovie = @"discover/movie";

NSString *const TAAccountFavoriteMovies = @"account/%@/favorite/movies";
NSString *const TAAccountChangeFavorite = @"account/%@/favorite";

NSString *const TAAccountWatchlistMovies = @"account/%@/watchlist/movies";
NSString *const TAAccountChangeWatchlist = @"account/%@/watchlist";