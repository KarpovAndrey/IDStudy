//
//  AKCarsWasher.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCarsWasher.h"
#import "AKCar.h"
#import "AKAccountant.h"

@interface AKCarsWasher ()

@end

@implementation AKCarsWasher

- (void)completeWorkWithObject:(AKCar *)car {
    car.state = kAKCarStateClean;
}

@end
