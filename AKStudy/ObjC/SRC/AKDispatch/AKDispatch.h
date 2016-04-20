//
//  AKDispatch.h
//  AKStudy
//
//  Created by Admin on 18.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKDispatch : NSObject

typedef void (^AKObjectHandler)(void);

typedef enum {
    kAKPriorityMain,
    kKAPriorityBackground,
    kAKPriorityDefault,
    kAKPriorityHigh,
    kAKPriorityLow
} AKDispatchPriority;

extern
void AKDispatchAsyncWithPriority(AKDispatchPriority priority, AKObjectHandler handler);
extern
void AKDispatchAsyncInBackground(AKObjectHandler handler);
extern
void AKDispatchAsyncOnMainThread(AKObjectHandler handler);
extern
void AKDispatchAsyncDefaultPriority(AKObjectHandler handler);
extern
void AKDispatchAsyncHighPriority(AKObjectHandler handler);
extern
void AKDispatchAsyncLowPriority(AKObjectHandler handler);

extern
void AKDispatchSyncWithPriority(AKDispatchPriority priority, AKObjectHandler handler);
extern
void AKDispatchSyncInBackground(AKObjectHandler handler);
extern
void AKDispatchSyncOnMainThread(AKObjectHandler handler);
extern
void AKDispatchSyncDefaultPriority(AKObjectHandler handler);
extern
void AKDispatchSyncHighPriority(AKObjectHandler handler);
extern
void AKDispatchSyncLowPriority(AKObjectHandler handler);

@end
