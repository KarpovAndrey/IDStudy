//
//  AKWorkerProtocol.h
//  AKStudy
//
//  Created by Admin on 12.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, AKEmployeeState) {
    kAKEmployeeStateUndefined,
    kAKEmployeeStateBusy,
    kAKEmployeeStateFree,
    kAKEmployeeStateWaiting
};

@protocol AKWorkerProtocol <NSObject>

@optional
- (void)employeeBecameWaiting:(id)employee;
- (void)employeeDidStartWork:(id)employee;
- (void)employeeDidFinishWork:(id)employee;

@end
