//
//  AKQueue.m
//  AKStudy
//
//  Created by Admin on 03.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKQueue.h"

@implementation AKQueue

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queue = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementations

- (void)addObjectToQueue:(id)object {
    [self.queue addObject:object];
}

- (void)removeObjectFromQueue:(id)object {
    [self.queue removeObject:object];
}

- (id)objectFromQueue {
    id object = [self.queue lastObject];
    
    if (object) {
        [self removeObjectFromQueue:object];
    }
    
    return object;
}

@end
