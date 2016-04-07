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
#import "AKDispatcher.h"

static const NSUInteger kAKCarWashersCount     = 3;
static const NSUInteger kAKCarAccountantsCount = 2;

@interface AKEnterprise()
@property (nonatomic, retain) NSMutableArray    *staff;

@property (nonatomic, retain) AKDispatcher      *washerDispatcher;
@property (nonatomic, retain) AKDispatcher      *accountantDispatcher;
@property (nonatomic, retain) AKDispatcher      *bossDispatcher;

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
    self.washerDispatcher = nil;
    self.accountantDispatcher = nil;
    self.bossDispatcher = nil;
    
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
#pragma mark Private

- (void)hireStaff {
    AKBoss *boss = [AKBoss object];
    self.bossDispatcher = [[[AKDispatcher alloc] initWithStaff:@[boss]] autorelease];
    
    NSArray *accountants = [AKAccountant employeesWithCount:kAKCarAccountantsCount observers:@[boss]];
    self.accountantDispatcher = [[[AKDispatcher alloc] initWithStaff:@[accountants[0], accountants[1]]] autorelease];
    
    NSArray *washers = [AKAccountant employeesWithCount:kAKCarAccountantsCount observers:@[self]];
    self.washerDispatcher = [[[AKDispatcher alloc] initWithStaff:@[washers[0], washers[1], washers[2]]] autorelease];
    self.staff = [NSMutableArray arrayWithObjects: boss, nil];
    
    self.staff = [NSMutableArray arrayWithObject:boss];
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

#pragma mark -
#pragma mark Public

- (void)washCar:(AKCar *)car {
    [self.washerDispatcher addObject:car];
}

#pragma mark -
#pragma mark Worker Protocol

- (void)employeeBecameWaiting:(id<AKMoneyProtocol>)employee {
    if ([employee isMemberOfClass:[AKCarsWasher class]]) {
        [self.accountantDispatcher addObject:employee];
    }
    
    if ([employee isMemberOfClass:[AKAccountant class]]) {
        [self.bossDispatcher addObject:employee];
    }
}

@end
