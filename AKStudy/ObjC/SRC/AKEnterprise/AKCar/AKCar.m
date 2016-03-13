//
//  AKCar.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCar.h"

static const NSUInteger carCash = 100;

@implementation AKCar

@synthesize money = _money;

#pragma mark - 
#pragma mark - Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.carState = kAKCarStateDirty;
        self.money = carCash;
    }
    
    return self;
}

#pragma mark -
#pragma mark - Money Protocol

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    
    self.carState = kAKCarStateClean;
    
    return payment;
}

@end
