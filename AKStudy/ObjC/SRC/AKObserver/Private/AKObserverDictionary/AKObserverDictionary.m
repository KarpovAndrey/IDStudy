//
//  AKObserverDictionary.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverDictionary.h"
#import "AKObserverArray.h"
#import "AKObserverObject.h"

@interface AKObserverDictionary ()
@property (nonatomic, assign) NSUInteger        state;
@property (nonatomic, retain) AKObserverArray   *arrayObservers;

@end

@implementation AKObserverDictionary

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    [self removeAllHandlers];
    self.arrayObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithState:0];
}

- (instancetype)initWithState:(NSUInteger)state {
    self = [super init];
    if (self) {
        self.state = state;
        self.arrayObservers = [AKObserverArray object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)handlers {
    [self.arrayObservers removeHandlersForObject:nil];
    
    NSMutableArray *handlers = [NSMutableArray array];
    for (AKObserverObject *observer in self.arrayObservers.handlersObjects) {
        [handlers addObject:observer.handler];
    }
    
    return [[handlers copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler object:(id)object  {
    AKObserverArray *observerArray = [AKObserverArray object];
    [observerArray addHandler:handler forObject:object];
    self.arrayObservers = observerArray;
}

- (void)removeHandlersForObject:(id)object {
    [self.arrayObservers removeHandlersForObject:object];
}

- (void)removeAllHandlers {
    [self.arrayObservers removeAllHandlers];
}

@end
