//
// Created by Uladzimir Predka on 7/24/15.
// Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TADispatchManagement.h"

void ta_dispatch_async(dispatch_block_t block) {
    ta_dispatch_on_queue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

void ta_dispatch_safe_queue(dispatch_block_t block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        ta_dispatch_on_queue(dispatch_get_main_queue(), block);
    }
}

void ta_dispatch_main_queue(dispatch_block_t block) {
    ta_dispatch_on_queue(dispatch_get_main_queue(), block);
}

void ta_dispatch_on_queue(dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_async(queue, block);
}

void ta_dispatch_after_on_queue(float seconds, dispatch_queue_t queue, dispatch_block_t block) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC), queue, block);
}

void ta_dispatch_after(float seconds, dispatch_block_t block) {
    ta_dispatch_after_on_queue(seconds, dispatch_get_main_queue(), block);
}

@implementation TADispatchPool {
    NSArray *targetQueues;
    NSInteger lastIdx;

    BOOL appendDelay;
}

- (instancetype)initWithQueueCount:(NSInteger)count
{
    if (self = [super init]) {
        NSMutableArray *queues = [NSMutableArray new];

        if (count == 0) {
            count = 1;
        }

        for (NSInteger idx = 0; idx < count; idx++) {
            dispatch_queue_t queue = dispatch_queue_create("ADDispatchPoolTargetQueue", DISPATCH_QUEUE_SERIAL);
            [queues addObject:queue];
        }

        targetQueues = [NSArray arrayWithArray:queues];
    }
    return self;
}

- (void)scheduleTask:(void (^)(void))task
{
    if (lastIdx == targetQueues.count) {
        lastIdx = 0;
        appendDelay = NO;
    }

    dispatch_queue_t targetQueue = targetQueues[lastIdx++];
    dispatch_async(targetQueue, task);
}

@end
