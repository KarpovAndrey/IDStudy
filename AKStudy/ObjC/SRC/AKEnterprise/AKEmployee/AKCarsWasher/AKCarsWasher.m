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
    sleep(arc4random_uniform(1) + 1);

    car.state = kAKCarStateClean;
}

@end

