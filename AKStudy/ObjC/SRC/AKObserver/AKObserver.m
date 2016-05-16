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
@property (nonatomic, retain) NSMutableArray *observerDictionaries;

- (AKObserverDictionary *)dictonaryForState:(NSUInteger)state;
- (void)performHandlerForState:(NSUInteger)state withObject:(id)object;

@end

@implementation AKObserver

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.observerDictionaries = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observerDictionaries = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
        }

        [self performHandlerForState:_state withObject:object];
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler forState:(NSUInteger)state object:(id)object {
    if (object) {
        AKObserverDictionary *dictionary = [self dictonaryForState:state];
        
        [dictionary addHandler:handler object:object];
    }
}

- (void)removeHandlersForState:(NSUInteger)state {
    for (AKObserverDictionary *observerDictionary in self.observerDictionaries) {
        if (observerDictionary.state == state) {
            [self.observerDictionaries removeObject:observerDictionary];
        }
    }
}

- (void)removeHandlersForObject:(id)object {
    if (object) {
        for (AKObserverDictionary *observerDictionary in self.observerDictionaries) {
            [observerDictionary removeHandlersForObject:object];
        }
    }
}

#pragma mark -
#pragma mark Private

- (AKObserverDictionary *)dictonaryForState:(NSUInteger)state {
    for (AKObserverDictionary *observerDictionary in self.observerDictionaries) {
        if (observerDictionary.state == state) {
            return observerDictionary;
        }
    }
    
    AKObserverDictionary *dictionary = [AKObserverDictionary dictionaryWithState:state];
    [self.observerDictionaries addObject:dictionary];

    return dictionary;
}

- (void)performHandlerForState:(NSUInteger)state withObject:(id)object {
    for (AKObserverDictionary *observerDictionary in self.observerDictionaries) {
        if (observerDictionary.state == self.state) {
            for (AKObjectHandler handler in observerDictionary.handlers) {
                handler(object);
            }
        }
    }
}

@end