//
//  AKDispatch.h
//  AKStudy
//
//  Created by Admin on 18.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKDispatch : NSObject

typedef void (^AKDispatchHandler)(void);

typedef enum {
    kAKPriorityMain,
    kKAPriorityBackground,
    kAKPriorityDefault,
    kAKPriorityHigh,
    kAKPriorityLow
} AKDispatchPriority;

extern
void AKDispatchAsyncWithPriority(AKDispatchPriority priority, AKDispatchHandler handler);
extern
void AKDispatchAsyncInBackground(AKDispatchHandler handler);
extern
void AKDispatchAsyncOnMainThread(AKDispatchHandler handler);
extern
void AKDispatchAsyncDefaultPriority(AKDispatchHandler handler);
extern
void AKDispatchAsyncHighPriority(AKDispatchHandler handler);
extern
void AKDispatchAsyncLowPriority(AKDispatchHandler handler);

extern
void AKDispatchSyncWithPriority(AKDispatchPriority priority, AKDispatchHandler handler);
extern
void AKDispatchSyncInBackground(AKDispatchHandler handler);
extern
void AKDispatchSyncOnMainThread(AKDispatchHandler handler);
extern
void AKDispatchSyncDefaultPriority(AKDispatchHandler handler);
extern
void AKDispatchSyncHighPriority(AKDispatchHandler handler);
extern
void AKDispatchSyncLowPriority(AKDispatchHandler handler);

@end
