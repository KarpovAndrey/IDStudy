//
//  AKEmployee.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKEmployee.h"

@implementation AKEmployee

- (NSUInteger)takeMoney {
    NSUInteger money = self.money;
    self.money = 0;
    
    return money;
}

@end
