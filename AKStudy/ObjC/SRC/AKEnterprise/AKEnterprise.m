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

#import "AKObserver.h"

static const NSUInteger kAKCarWashersCount = 3;

@interface AKEnterprise()
@property (nonatomic, retain) NSMutableArray    *staff;
@property (nonatomic, retain) NSMutableArray *queueCars;

- (void)hireStaff;
- (void)dismissStaff;

@end

@implementation AKEnterprise

#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    [self dismissStaff];
    self.staff = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queueCars = [NSMutableArray object];
        
        [self hireStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Private

- (void)hireStaff {
    AKBoss *boss = [AKBoss object];
    
    AKAccountant *accountant = [AKAccountant object];
    [accountant addObserver:boss];

    NSMutableArray *staff = [NSMutableArray arrayWithObjects:boss, accountant, nil];
    NSArray *washers = [AKEmployee employeesOfClass:[AKCarsWasher class]
                                          withCount:kAKCarWashersCount
                                          observers:@[accountant, self]];
  
    [staff addObjectsFromArray:washers];
    self.staff = [[staff copy] autorelease];
}

- (void)dismissStaff {
    [self.staff removeAllObjects];
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
#pragma mark - Public

- (void)dismissEmployee:(AKEmployee *)object {
    for (AKEmployee *employee in self.staff) {
        if ([employee isObservedByObject:object]) {
            if ([employee respondsToSelector:@selector(removeObserver:)]) {
                [employee removeObserver:object];
            }
        }
    }
    
    [self.staff removeObject:object];
}

- (void)washCar:(AKCar *)car {
    AKCarsWasher *carWasher = [self freeEmployeeWithClass:[AKCarsWasher class]];
    
    if (carWasher) {
        [carWasher performWorkWithObject:car];
    } else {
        [self.queueCars addObject:car];
    }
}

#pragma mark -
#pragma mark Worker Protocol

- (void)workerIsWaiting:(AKCarsWasher *)washer {
    AKCar *car = nil;
    NSMutableArray *cars = self.queueCars;
    
    @synchronized(cars) {
        car = [cars lastObject];
        
        [cars removeObject:car];
        [washer performWorkWithObject:car];
    }
}

@end
