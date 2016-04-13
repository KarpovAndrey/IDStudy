//
//  AKEmployee.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKEmployee.h"
#import "AKCar.h"

@interface AKEmployee()

- (void)completeWork;
- (void)completeWorkWithObject:(id)object;
- (void)workWithObject:(id)object;
- (void)performWorkInBackgroundWithObject:(id)object;

@end

@implementation AKEmployee
@synthesize money = _money;

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.state = kAKEmployeeStateFree;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id <AKMoneyProtocol>)object {
    @synchronized(self) {
        if (object) {
            NSLog(@"%@ starting", self);
            
            if (self.state == kAKEmployeeStateFree) {
                self.state = kAKEmployeeStateBusy;
                
                [self performSelectorInBackground:@selector(performWorkInBackgroundWithObject:)
                                       withObject:object];
            }
        }
    }
}

#pragma mark -
#pragma mark Private

- (void)performWorkInBackgroundWithObject:(id)object {
    @synchronized(self) {
        [self workWithObject:object];
        
        [self performSelectorOnMainThread:@selector(completeWork) withObject:nil waitUntilDone:NO];
    }
}

- (void)workWithObject:(id)object {
    @synchronized (self) {
        usleep(arc4random_uniform(1) + 1);
        
        [self takeMoney:[object giveMoney]];
        NSLog(@"%@ take money from %@, he has %lu money", self, object, self.money);
        [self completeWorkWithObject:object];
    }
}

- (void)completeWorkWithObject:(id)object {
    @synchronized (self) {
        if ([object isKindOfClass:[AKEmployee class]]) {
            AKEmployee *employee = (AKEmployee *)object;
            employee.state = kAKEmployeeStateFree;
        }
    }
}

- (void)completeWork {
    self.state = kAKEmployeeStateStandby;
}

#pragma mark -
#pragma mark Money Protocol

- (NSUInteger)giveMoney {
    @synchronized(self) {
        NSUInteger payment = self.money;
        self.money = 0;
        
        return payment;
    }
}

- (void)takeMoney:(NSUInteger)money {
    @synchronized(self) {
        self.money += money;
    }
}

@end
