//
//  AKObserver.m
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserver.h"

@interface AKObserver ()
@property  (nonatomic, assign) NSMutableArray *mutableObservers;
//@property  (nonatomic, assign) NSUInteger     stateObserver;

@end

@implementation AKObserver

@dynamic observers;
@dynamic state;

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableArray array];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)observers {
    return [self.mutableObservers copy];
}
//
//- (NSUInteger)state {
//    return self.stateObserver;
//}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    [self.mutableObservers addObject:observer];
}

- (void)removeObserver:(id)observer {
    [self.mutableObservers removeObject:observer];
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

- (void)notifyObservers {
    [self notifyObserversWithSelector:[self selectorForState:self.state]];
}

- (void)notifyObserversWithSelector:(SEL)selector {
    for (id observer in self.observers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector];
        }
    }
}

@end
