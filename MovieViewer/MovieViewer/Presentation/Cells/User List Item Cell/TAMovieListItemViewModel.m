//
//  TAMovieListItemViewModel.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMovieListItemViewModel.h"
#import "TAListItemObject.h"

@implementation TAMovieListItemViewModel {
    TAListItemObject *_listItem;
}

- (instancetype)initWithListItem:(TAListItemObject *)listItem
{
    self = [super init];
    if (self) {
        _listItem = listItem;
    }
    return self;
}

- (NSString *)title
{
    return [_listItem title];
}

- (void)performRemoveFromList
{
    if ([self.actionDelegate respondsToSelector:@selector(performRemoveListItemViewModel:)]) {
        [self.actionDelegate performRemoveListItemViewModel:self];
    }
}

@end
