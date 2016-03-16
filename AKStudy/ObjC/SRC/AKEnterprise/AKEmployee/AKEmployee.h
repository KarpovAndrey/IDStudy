//
//  AKEmployee.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKMoneyProtocol.h"
#import "AKWorkerProtocol.h"

#import "AKObserver.h"

@class AKEmployee;
@protocol AKEmployeeStateProtocol <NSObject>

@optional

- (void)employeeGotFree;
- (void)employeeBecameBusy;

@end


@interface AKEmployee : AKObserver <AKMoneyProtocol, AKWorkerProtocol, AKEmployeeStateProtocol>
//@property (nonatomic, assign) id <AKWorkerProtocol> delegate;
@property (nonatomic, assign) AKEmployeeState state;

- (void)performWorkWithObject:(id)object;

@end
