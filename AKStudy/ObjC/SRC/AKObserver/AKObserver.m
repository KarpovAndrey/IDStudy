//
//  AKObserver.m
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserver.h"
#import "AKObserverDictionary.h"
#import "AKObserverArray.h"
#import "AKObserverObject.h"

@interface AKObserver ()
@property (nonatomic, retain) NSMutableArray *observers;

@end

@implementation AKObserver
@synthesize state = _state;

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.observers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
            
            for (AKObserverDictionary *observerDictionary in self.observers) {
                if (observerDictionary.state == state) {
                    for (AKObserverObject *observer in observerDictionary.arrayObservers.handlersObject) {
                        observer.handler();
                    }
                }
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler forState:(NSUInteger)state object:(id)object {
    AKObserverDictionary *dictionary = [AKObserverDictionary object];
    [dictionary addHandler:handler forstate:state object:object];
    [self.observers addObject:dictionary];
}

- (void)removeHandlerForState:(NSUInteger)state {
    for (AKObserverDictionary *observerDictionary in self.observers) {
        if (observerDictionary.state == state) {
            [self.observers removeObject:observerDictionary];
        }
    }
}

- (void)removeHandlerForObject:(id)object {
    for (AKObserverDictionary *observerDictionary in self.observers) {
        [observerDictionary removeHandlersForObject:object];
    }
}

@end