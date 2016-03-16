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
@synthesize state = _state;

#pragma mark - 
#pragma mark - Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kAKCarStateDirty;
        self.money = carCash;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(AKCarState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObservers];
    }
}

#pragma mark -
#pragma mark Public

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kAKCarStateClean:
            return @selector(carWashed);
            
        case kAKCarStateDirty:
            return @selector(carSolied);
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark - Money Protocol

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    
    return payment;
}

@end
