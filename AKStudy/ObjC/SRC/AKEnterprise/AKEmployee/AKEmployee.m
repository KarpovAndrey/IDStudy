 //
//  AKEmployee.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKEmployee.h"
#import "AKCar.h"

@implementation AKEmployee
@synthesize state = _state;
@synthesize money = _money;

#pragma mark -
#pragma mark Class Methods

+ (NSArray *)employeesOfClass:(Class)theClass
                   withCount:(NSUInteger)count
                   observers:(NSArray *)observers
{
    NSArray *employees = [NSArray objectWithCount:count ofClass:theClass];
    for (AKEmployee *employee in employees) {
        for (id observer in observers) {
            [employee addObserver:observer];
        }
    }
    
    return employees;
}

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
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObservers];
    }
}

#pragma mark -
#pragma mark Public

- (void)performWorkWithObject:(id <AKMoneyProtocol>)object {
    NSLog(@"%@ starting", self);
    
    sleep(arc4random_uniform(2) + 1);
    self.state = kAKEmployeeStateBusy;
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
    self.state = kAKEmployeeStateWaiting;
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kAKEmployeeStateFree:
            return @selector(workerDidFinishWork:);
            
        case kAKEmployeeStateBusy:
            return @selector(workerDidStartWork:);
            
        case kAKEmployeeStateWaiting:
            return @selector(workerIsWaiting:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Private

- (void)completeWorkWithObject:(id)object {
    if ([object isKindOfClass:[AKEmployee class]]) {
        AKEmployee *employee = (AKEmployee *)object;
        employee.state = kAKEmployeeStateFree;
    }
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

- (void)workerDidStartWork:(id)worker {
    
}

- (void)workerDidFinishWork:(id)worker {
    
}

- (void)workerIsWaiting:(id<AKMoneyProtocol>)worker {
    [self performWorkWithObject:worker];
}

@end
