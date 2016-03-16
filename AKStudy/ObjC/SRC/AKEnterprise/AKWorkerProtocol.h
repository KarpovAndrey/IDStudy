//
//  AKWorkerProtocol.h
//  AKStudy
//
//  Created by Admin on 12.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, AKEmployeeState) {
    kAKEmployeeStateBusy,
    kAKEmployeeStateFree,
    kAKEmployeeStateUndefined
};

@protocol AKWorkerProtocol <NSObject>
- (void)workerDidFinishWorkWithObject:(id<AKMoneyProtocol>)object;

@end
