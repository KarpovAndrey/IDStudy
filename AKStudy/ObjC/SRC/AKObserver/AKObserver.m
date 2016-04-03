//
//  AKObserver.m
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserver.h"

@interface AKObserver ()
@property  (nonatomic, retain) NSHashTable *mutableObservers;

@end

@implementation AKObserver
@synthesize state = _state;

@dynamic observers;

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    return [[self.mutableObservers copy] autorelease];
}

- (NSUInteger)state {
    return 0;
}

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
            
            [self notifyObservers];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    @synchronized(self.mutableObservers) {
        [self.mutableObservers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self.mutableObservers) {
        [self.mutableObservers removeObject:observer];
    }
}

- (BOOL)isObservedByObject:(id)object {
    return [self.mutableObservers containsObject:object];
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

- (void)notifyObservers {
    [self notifyObserversWithSelector:[self selectorForState:self.state]];
}

- (void)notifyObserversWithSelector:(SEL)selector {
        for (id observer in self.mutableObservers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self];
            }
        }
}

@end
