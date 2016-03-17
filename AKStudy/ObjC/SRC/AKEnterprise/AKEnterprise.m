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

@interface AKEnterprise()
@property (nonatomic, retain) NSHashTable    *staff;
@property (nonatomic, retain) AKCar          *car;

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
        self.staff = [NSHashTable weakObjectsHashTable];

        [self hireStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setCar:(AKCar *)car {
    if (_car != car) {
        [_car removeObserver:self];
        _car = car;
        [_car addObserver:self];
    }
}

#pragma mark -
#pragma mark - Private

- (void)hireStaff {
    AKBoss *boss = [AKBoss object];
    AKAccountant *accountant = [AKAccountant object];
    AKCarsWasher *carsWasher = [AKCarsWasher object];
    
    [self.staff addObject:boss];
    [self.staff addObject:accountant];
    [self.staff addObject:carsWasher];

    [carsWasher addObserver:accountant];
    [accountant addObserver:boss];
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
    self.car = car;
    
    AKCarsWasher *carWasher = [self freeEmployeeWithClass:[AKCarsWasher class]];
    [carWasher performWorkWithObject:car];
}

#pragma mark -
#pragma mark AKCarStateProtocol

- (void)carWashed {
    NSLog(@"CAR WASHED");
}

- (void)carSolied {
    NSLog(@"CAR SOILED");
}

@end
