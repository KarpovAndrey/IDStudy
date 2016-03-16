//
//  AKEnterprise.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKCar.h"
#import "AKEmployee.h"
@class AKCar;

@interface AKEnterprise <AKCarStateProtocol, AKEmployeeStateProtocol>: NSObject

- (void)washCar:(AKCar *)car;

@end
