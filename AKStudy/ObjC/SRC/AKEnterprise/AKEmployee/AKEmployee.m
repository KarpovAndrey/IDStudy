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
@synthesize state = _state;
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

- (void)performWorkWithObject:(AKEmployee *)object {
    NSLog(@"%@ starting", self);

    self.state = kAKEmployeeStateBusy;
    [self takeMoney:[object giveMoney]];
    [self completeWorkWithObject:object];
    self.state = kAKEmployeeStateFree;

    [self workerDidFinishWorkWithObject:object];
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

#pragma mark -
#pragma mark Accessors

- (void)setState:(AKEmployeeState)state {
    if (_state != state) {
        _state = state;
        
        [self notifyObservers];
    }
}

#pragma mark -
#pragma mark Private

- (void)completeWorkWithObject:(AKEmployee *)object {
    object.state = kAKEmployeeStateFree;
}

#pragma mark -
#pragma mark Public

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case kAKEmployeeStateFree:
            return @selector(employeeGotFree);
            
        case kAKEmployeeStateBusy:
            return @selector(employeeBecameBusy);
            
        default:
            return [super selectorForState:state];
    }
}

- (void)employeeGotFree {
    NSLog(@"ASDASDASD");
}
@end
