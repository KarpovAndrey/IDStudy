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
    kAKEmployeeStateStandby
};

@protocol AKWorkerProtocol <NSObject>

@optional
- (void)employeeBecameStandby:(id)employee;
- (void)employeeDidStartWork:(id)employee;
- (void)employeeDidFinishWork:(id)employee;

@end
