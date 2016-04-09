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

static const NSUInteger kAKCarWashersCount  = 3;
static const NSUInteger kAKAccountantsCount = 2;

@interface AKEnterprise()
@property (nonatomic, retain) AKDispatcher      *washerDispatcher;
@property (nonatomic, retain) AKDispatcher      *accountantDispatcher;
@property (nonatomic, retain) AKDispatcher      *bossDispatcher;

- (void)hireStaff;
- (AKDispatcher *)dispatherForObject:(id)object;

@end

@implementation AKEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
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
    
    NSArray *accountants = [AKAccountant employeesWithCount:kAKAccountantsCount observer:self];
    self.accountantDispatcher = [[[AKDispatcher alloc] initWithStaff:accountants] autorelease];
    
    NSArray *washers = [AKCarsWasher employeesWithCount:kAKCarWashersCount observer:self];
    self.washerDispatcher = [[[AKDispatcher alloc] initWithStaff:washers] autorelease];
}

- (AKDispatcher *)dispatherForObject:(id)object {
    return [self.washerDispatcher containsEmployee:object] ? self.accountantDispatcher : self.bossDispatcher;
}

#pragma mark -
#pragma mark Public

- (void)washCar:(AKCar *)car {
    @synchronized (self) {
        [self.washerDispatcher workWithObject:car];
    }
}

#pragma mark -
#pragma mark Observer Protocol

- (void)employeeBecameWaiting:(id)employee {
    [[self dispatherForObject:employee] workWithObject:employee];
}

@end
