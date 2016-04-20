//
//  AKObserverArray.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverArray.h"
#import "AKObserverObject.h"

@interface AKObserverArray ()
@property (nonatomic, retain) NSMutableArray *handlers;

@end

@implementation AKObserverArray

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.handlers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.handlers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)handlersObjects {
    return [[self.handlers copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler forObject:(id)object {
    AKObserverObject *observerObject = [AKObserverObject observerObjectWithObject:object handler:handler];
    [self.handlers addObject:observerObject];
}

- (void)removeHandlersForObject:(id)object {
    NSArray *objects = [[self.handlersObjects copy] autorelease];
    for (AKObserverObject *observerObject in objects) {
        if (observerObject.object == object) {
            [self.handlers removeObject:observerObject];
        }
    }
}

- (void)removeAllHandlers {
    [self.handlers removeAllObjects];
}

@end
