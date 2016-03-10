//
//  AKEnterprise.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKEnterprise.h"

#import "AKCarsWasher.h"
#import "AKBoss.h"
#import "AKAccountant.h"

@interface AKEnterprise()
@property (nonatomic, retain) NSMutableArray *staff;

- (void)hireStaff;
- (void)dismissStaff;

@end

@implementation AKEnterprise

#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc
{
    [self dismissStaff];
    self.staff = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Private

- (void)hireStaff {
    AKBoss *boss = [AKBoss object];
    AKAccountant *accountant = [AKAccountant object];
    AKCarsWasher *carsWasher = [AKCarsWasher object];
    
    self.staff = [@[boss, accountant, carsWasher] mutableCopy];

}

- (void)dismissStaff {
    for (AKEmployee *employee in self.staff){
        [self.staff removeObject:employee];
    }
}

- (id)freeEmployeeWithClass:(Class)class {
    for (AKEmployee *employee in self.staff) {
        if ([employee isMemberOfClass:class]) {
            return employee;
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark - Public

- (void)addCarToWash:(AKCar *)car {
    AKCarsWasher *carWasher = [self freeEmployeeWithClass:[AKCarsWasher class]];
    [carWasher washCar:car];
}


@end
