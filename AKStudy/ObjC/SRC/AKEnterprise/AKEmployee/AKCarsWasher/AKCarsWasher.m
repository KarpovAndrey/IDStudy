//
//  AKCarsWasher.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCarsWasher.h"

@implementation AKCarsWasher

- (void)washCar:(AKCar *)car {
    NSLog(@"CAR WASHED");
    
    self.money = [car takeMoney];
}

@end

