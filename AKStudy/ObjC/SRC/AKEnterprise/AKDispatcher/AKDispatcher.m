//
//  AKDispatcher.m
//  AKStudy
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKDispatcher.h"
#import "AKEmployee.h"
#import "AKQueue.h"

@interface AKDispatcher ()
@property (nonatomic, retain) NSMutableArray *staff;
@property (nonatomic, retain) AKQueue        *queue;

- (AKEmployee *)vacantEmployee;

@end

@implementation AKDispatcher

#pragma mark -
#pragma mark Initialization & Deallocation

- (void)dealloc {
    self.staff = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [self initWithStaff:nil];
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithStaff:(NSArray *)staff {
    self = [super init];
    if (self) {
        self.staff = [[staff mutableCopy] autorelease];
        self.queue = [AKQueue object];
    }
    
    return self;
}

#pragma mark -
#pragma marok Accessors

- (void)setStaff:(NSMutableArray *)staff {
    if (_staff != staff) {
        _staff = staff;
        
        [_staff makeObjectsPerformSelector:@selector(addObserver:) withObject:self];
    }
}

#pragma mark -
#pragma mark Public

- (BOOL)containsEmployee:(AKEmployee *)employee {
    return [self.staff containsObject:employee];
}

- (void)addObject:(id)object {
    @synchronized (self) {
        [self.queue pushObject:object];
        AKEmployee *employee = [self vacantEmployee];
        
        if (employee) {
            [employee performWorkWithObject:[self.queue popObject]];
        }
    }
}

#pragma mark -
#pragma mark Private

- (AKEmployee *)vacantEmployee {
    for (AKEmployee *employee in self.staff) {
        if (employee.state == kAKEmployeeStateFree) {
            return employee;
        }
    }
    return nil;
}

@end
