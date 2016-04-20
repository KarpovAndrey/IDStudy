//
//  AKDispatch.m
//  AKStudy
//
//  Created by Admin on 18.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKDispatch.h"

@implementation AKDispatch

#pragma mark -
#pragma mark Private Declarations

static
dispatch_queue_t AKQueueWithPriority(AKDispatchPriority priority);

#pragma mak -
#pragma mark Public Implementations Async Methods

void AKDispatchAsyncWithPriority(AKDispatchPriority priority, AKObjectHandler handler) {
    dispatch_async(AKQueueWithPriority(priority), handler);
}

void AKDispatchAsyncInBackground(AKObjectHandler handler) {
    AKDispatchAsyncWithPriority(kKAPriorityBackground, handler);
}
void AKDispatchAsyncOnMainThread(AKObjectHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityMain, handler);
}

void AKDispatchAsyncDefaultPriority(AKObjectHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityDefault, handler);
}

void AKDispatchAsyncHighPriority(AKObjectHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityHigh, handler);
    
}
void AKDispatchAsyncLowPriority(AKObjectHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityLow, handler);
}

#pragma mak -
#pragma mark Public Implementations Sync Methods

void AKDispatchSyncWithPriority(AKDispatchPriority priority, AKObjectHandler handler) {
    dispatch_sync(AKQueueWithPriority(priority), handler);
}

void AKDispatchSyncInBackground(AKObjectHandler handler) {
    AKDispatchSyncWithPriority(kKAPriorityBackground, handler);
}

void AKDispatchSyncOnMainThread(AKObjectHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityMain, handler);
}

void AKDispatchSyncDefaultPriority(AKObjectHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityDefault, handler);
}

void AKDispatchSyncHighPriority(AKObjectHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityHigh, handler);
}

void AKDispatchSyncLowPriority(AKObjectHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityLow, handler);
}

#pragma mark -
#pragma mark Private Implementations

dispatch_queue_t AKQueueWithPriority(AKDispatchPriority priority) {
    switch (priority) {
        case kAKPriorityMain:
            return dispatch_get_main_queue();
            
        case kKAPriorityBackground:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
            
        case kAKPriorityLow:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
            
        case kAKPriorityHigh:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
            
        case kAKPriorityDefault:
            return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
}

@end
