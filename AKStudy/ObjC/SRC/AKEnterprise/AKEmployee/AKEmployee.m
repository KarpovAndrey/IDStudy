 //
//  AKEmployee.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKEmployee.h"
#import "AKCar.h"

@interface AKEmployee ()

- (void)changeBusynessToFree:(id<AKMoneyProtocol>)employee;
- (void)changeBusynessToBusy:(id<AKMoneyProtocol>)employee;

@end

@implementation AKEmployee
@synthesize busyness = _busyness;
@synthesize delegate = _delegate;
@synthesize money = _money;

#pragma mark -
#pragma mark Private

- (void)changeBusynessToFree:(id<AKMoneyProtocol>)employee {
    self.busyness = kAKWorkerFree;
}

- (void)changeBusynessToBusy:(id<AKMoneyProtocol>)employee {
    self.busyness = kAKWorkerBusy;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id)object {
    NSLog(@"%@ starting", self);
    [self takeMoney:[object giveMoney]];
    
    if (self.delegate) {
        [self.delegate workerDidFinishWorkWithObject:self];
    } else {
        [self changeBusynessToFree:self];
    }
}

#pragma mark -
#pragma mark - Money Protocol

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;
    [self changeBusynessToFree:self];

    return payment;
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
    [self changeBusynessToBusy:self];
}

#pragma mark -
#pragma mark - Worker Protocol

- (void)workerDidFinishWorkWithObject:(id<AKMoneyProtocol>)object {
    [self performWorkWithObject:object];
}

@end
