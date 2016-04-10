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
    self.handlersDictionary = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
        self.handlersDictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    return [[self.mutableObservers copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
            
            NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
            void (^employeeBlock)(void) = [self.handlersDictionary objectForKey:keyNumber];
            
            if (employeeBlock) {
                employeeBlock();
            }
            
            [self notifyObservers];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addBlockForState:(AKEmployeeHandler)employeeBlock state:(NSUInteger)state {
    [self removeBlockForState:state];
    
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    [self.handlersDictionary setObject:[[employeeBlock copy] autorelease] forKey:keyNumber];
}

- (void)removeBlockForState:(NSUInteger)state {
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    [self.handlersDictionary removeObjectForKey:keyNumber];
}

- (void)addObserver:(id)observer {
    @synchronized(self) {
        [self.mutableObservers addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized(self) {
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
