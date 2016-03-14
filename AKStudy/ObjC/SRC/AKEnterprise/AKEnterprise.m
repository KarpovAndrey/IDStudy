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

@interface AKEnterprise()
@property (nonatomic, retain) NSMutableArray *staff;

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
        [self hireStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark - Private

- (void)hireStaff {
    AKBoss *boss = [AKBoss object];
    AKAccountant *accountant = [AKAccountant object];
    AKCarsWasher *carsWasher = [AKCarsWasher object];
    
    carsWasher.delegate = accountant;
    accountant.delegate = boss;

    self.staff = [@[boss, accountant, carsWasher] mutableCopy];
}

- (void)dismissStaff {
//    for (AKEmployee *employee in self.staff){
//        [self.staff removeObject:employee];
//    }
    [self.staff removeAllObjects];
}

- (id)freeEmployeeWithClass:(Class)class {
    for (AKEmployee *employee in self.staff) {
        if ([employee isMemberOfClass:class] && employee.workerState == kAKWorkerStateFree) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark - Public

- (void)washCar:(AKCar *)car {
    AKCarsWasher *carWasher = [self freeEmployeeWithClass:[AKCarsWasher class]];
    [carWasher performWorkWithObject:car];
}

@end
