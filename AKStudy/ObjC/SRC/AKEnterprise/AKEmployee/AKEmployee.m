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

@end

@implementation AKEmployee
@synthesize workerState = _busyness;
@synthesize money = _money;

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.workerState = kAKWorkerStateFree;
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(AKEmployee *)object {
    NSLog(@"%@ starting", self);

    self.workerState = kAKWorkerStateBusy;
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
    
    if (self.delegate) {
        [self.delegate workerDidFinishWorkWithObject:self];
    }
}

#pragma mark -
#pragma mark Private

- (void)completeWorkWithObject:(AKEmployee *)object {
    object.workerState = kAKWorkerStateFree;
}

#pragma mark -
#pragma mark - Money Protocol

- (NSUInteger)giveMoney {
    NSUInteger payment = self.money;
    self.money = 0;

    return payment;
}

- (void)takeMoney:(NSUInteger)money {
    self.money += money;
}

#pragma mark -
#pragma mark - Worker Protocol

- (void)workerDidFinishWorkWithObject:(id<AKMoneyProtocol>)object {
    [self performWorkWithObject:object];
}

@end
