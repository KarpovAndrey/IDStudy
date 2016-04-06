//
//  AKEnterprise.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKEnterprise.h"

#import "AKCarsWasher.h"
#import "AKAccountant.h"
#import "AKBoss.h"
#import "AKQueue.h"

#import "AKObserver.h"

static const NSUInteger kAKCarWashersCount     = 3;
static const NSUInteger kAKCarAccountantsCount = 2;

@interface AKEnterprise()
@property (nonatomic, retain) NSMutableArray    *staff;
@property (nonatomic, retain) AKQueue           *queueCars;

- (void)hireStaff;
- (void)dismissStaff;
- (void)dismissEmployee:(AKEmployee *)object;

@end

@implementation AKEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self dismissStaff];
    self.staff = nil;
    self.queueCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queueCars = [AKQueue object];
        
        [self hireStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)hireStaff {
    AKBoss *boss = [AKBoss object];
    NSArray *accountants = [AKAccountant employeesWithCount:kAKCarAccountantsCount observers:@[boss]];
    
    self.staff = [NSMutableArray arrayWithObjects: boss, nil];
    NSArray *washers = [AKCarsWasher employeesWithCount:kAKCarWashersCount
                                              observers:@[accountants[0], accountants[1], self]];
    
    [self.staff addObjectsFromArray:accountants];
    [self.staff addObjectsFromArray:washers];
}

- (void)dismissStaff {
    NSArray *staff = [[self.staff copy] autorelease];
    
    for (AKEmployee *employee in staff) {
        [self dismissEmployee:employee];
    }
}

- (void)dismissEmployee:(AKEmployee *)object {
    for (AKEmployee *employee in self.staff) {
        if ([employee isObservedByObject:object]) {
            [employee removeObserver:object];
        }
    }
    
    [self.staff removeObject:object];
}

- (id)freeEmployeeWithClass:(Class)class {
    for (AKEmployee *employee in self.staff) {
        if ([employee isMemberOfClass:class] && employee.state == kAKEmployeeStateFree) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(AKCar *)car {
    @synchronized(self) {
        [self.queueCars pushObject:car];
        AKCarsWasher *carWasher = [self freeEmployeeWithClass:[AKCarsWasher class]];
        
        if (carWasher) {
            [carWasher performWorkWithObject:[self.queueCars popObject]];
        }
    }
}

#pragma mark -
#pragma mark Worker Protocol

- (void)employeeBecameFree:(AKCarsWasher *)washer {
    @synchronized(self) {
        AKCar *car = [self.queueCars popObject];
        
        if (car) {
            [washer performWorkWithObject:car];
        }
    }
}

@end
