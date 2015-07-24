//
// Created by Uladzimir Predka on 7/24/15.
// Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void ad_dispatch_async(dispatch_block_t block);

extern void ad_dispatch_safe_queue(dispatch_block_t block);

extern void ad_dispatch_main_queue(dispatch_block_t block);

extern void ad_dispatch_on_queue(dispatch_queue_t queue, dispatch_block_t block);

extern void ad_dispatch_after_on_queue(float seconds, dispatch_queue_t queue, dispatch_block_t block);

extern void ad_dispatch_after(float seconds, dispatch_block_t block);


@interface ADDispatchPool : NSObject

- (instancetype)initWithQueueCount:(NSInteger)count;
- (void)scheduleTask:(void (^)(void))task;

@end