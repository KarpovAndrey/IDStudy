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
- (void)dismissStaff;
- (void)dismissEmployee:(AKEmployee *)object;

@end

@implementation AKDispatcher

#pragma mark -
#pragma mark Initialization & Deallocation

- (void)dealloc {
    [self dismissStaff];
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

- (void)workWithObject:(id)object {
    @synchronized (self) {
        if (object) {
            [self.queue pushObject:object];
            AKEmployee *employee = [self vacantEmployee];
            
            if (employee) {
                [employee performWorkWithObject:[self.queue popObject]];
            }
        }
        
    }
}

#pragma mark -
#pragma mark Private

- (AKEmployee *)vacantEmployee {
    @synchronized (self) {
        for (AKEmployee *employee in self.staff) {
            if (employee.state == kAKEmployeeStateFree) {
                return employee;
            }
        }
    }
    
    return nil;
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
#pragma mark Observer Protocol

- (void)employeeBecameFree:(id)employee {
    @synchronized (self) {
        [self workWithObject:[self.queue popObject]];
    }
}

@end
