//
//  AKCarsWasher.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCarsWasher.h"
#import "AKCar.h"

@implementation AKCarsWasher

- (void)completeWorkWithObject:(AKCar *)car {
    usleep(arc4random_uniform(100000) + 1);

    car.state = kAKCarStateClean;
}

@end

