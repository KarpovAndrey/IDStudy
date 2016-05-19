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

void AKDispatchAsyncWithPriority(AKDispatchPriority priority, AKDispatchHandler handler) {
    dispatch_async(AKQueueWithPriority(priority), handler);
}

void AKDispatchAsyncInBackground(AKDispatchHandler handler) {
    AKDispatchAsyncWithPriority(kKAPriorityBackground, handler);
}
void AKDispatchAsyncOnMainThread(AKDispatchHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityMain, handler);
}

void AKDispatchAsyncDefaultPriority(AKDispatchHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityDefault, handler);
}

void AKDispatchAsyncHighPriority(AKDispatchHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityHigh, handler);
    
}
void AKDispatchAsyncLowPriority(AKDispatchHandler handler) {
    AKDispatchAsyncWithPriority(kAKPriorityLow, handler);
}

#pragma mak -
#pragma mark Public Implementations Sync Methods

void AKDispatchSyncWithPriority(AKDispatchPriority priority, AKDispatchHandler handler) {
    dispatch_sync(AKQueueWithPriority(priority), handler);
}

void AKDispatchSyncInBackground(AKDispatchHandler handler) {
    AKDispatchSyncWithPriority(kKAPriorityBackground, handler);
}

void AKDispatchSyncOnMainThread(AKDispatchHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityMain, handler);
}

void AKDispatchSyncDefaultPriority(AKDispatchHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityDefault, handler);
}

void AKDispatchSyncHighPriority(AKDispatchHandler handler) {
    AKDispatchSyncWithPriority(kAKPriorityHigh, handler);
}

void AKDispatchSyncLowPriority(AKDispatchHandler handler) {
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
