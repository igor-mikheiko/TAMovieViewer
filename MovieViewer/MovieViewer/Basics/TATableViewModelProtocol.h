//
//  TATableViewModelProtocol.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TATableViewModelProtocol;

@protocol TATableViewDelegate

- (void)tableViewModel:(NSObject<TATableViewModelProtocol> *)tableViewModel didFetchNextData:(NSArray *)nextData;

- (void)tableViewModel:(NSObject<TATableViewModelProtocol> *)tableViewModel didFail:(NSError *)error;

@end

#pragma mark -

@protocol TATableViewModelProtocol <NSObject>

@property (nonatomic, strong, readonly) NSArray *fetchedData;

@property (nonatomic, weak) NSObject<TATableViewDelegate> *viewDelegate;

- (void)fetchNextData;

@end
