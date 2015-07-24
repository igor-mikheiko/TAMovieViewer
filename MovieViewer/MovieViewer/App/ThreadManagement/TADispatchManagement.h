//
// Created by Uladzimir Predka on 7/24/15.
// Copyright (c) 2015 *instinctools. All rights reserved.
//

#import <Foundation/Foundation.h>

extern void ta_dispatch_async(dispatch_block_t block);

extern void ta_dispatch_safe_queue(dispatch_block_t block);

extern void ta_dispatch_main_queue(dispatch_block_t block);

extern void ta_dispatch_on_queue(dispatch_queue_t queue, dispatch_block_t block);

extern void ta_dispatch_after_on_queue(float seconds, dispatch_queue_t queue, dispatch_block_t block);

extern void ta_dispatch_after(float seconds, dispatch_block_t block);


@interface TADispatchPool : NSObject

- (instancetype)initWithQueueCount:(NSInteger)count;
- (void)scheduleTask:(void (^)(void))task;

@end