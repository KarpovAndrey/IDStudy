//
//  AKObserverArray.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverArray.h"

@interface AKObserverArray ()

@end

@implementation AKObserverArray

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.handlersObject = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.handlersObject = [NSMutableArray array];
        
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler forObject:(id)object {
    AKObserverObject *observerObject = [[[AKObserverObject alloc] initWithObject:object
                                                                         handler:handler] autorelease];
    [self.handlersObject addObject:observerObject];
}

- (void)removeHandlersForObject:(id)object {
    NSArray *objects = [[self.handlersObject copy] autorelease];
    for (AKObserverObject *observerObject in objects) {
        if (observerObject.object == object) {
            [self.handlersObject removeObject:observerObject];
        }
    }
}

@end
