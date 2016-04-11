//
//  AKObserver.m
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserver.h"

@interface AKObserver ()

@end

@implementation AKObserver
@synthesize state = _state;

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.handlersDictionary = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.handlersDictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
            
            NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:_state];
            NSMutableArray *array = [self.handlersDictionary objectForKey:keyNumber];
                for (AKEmployeeHandler employeeHandler in array) {
                    employeeHandler();
                }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKEmployeeHandler)employeeHandler forState:(NSUInteger)state object:(id)object {
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    NSMutableArray *array = [self.handlersDictionary objectForKey:keyNumber];
    if (!array) {
        array = [NSMutableArray array];
    }
    
    [array addObject:[[employeeHandler copy] autorelease]];
    [self.handlersDictionary setObject:array forKey:keyNumber];
}

- (void)removeHandlerForState:(NSUInteger)state object:(id)object {
    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
    NSMutableArray *array = [self.handlersDictionary objectForKey:keyNumber];
    [array removeAllObjects];}

- (void)removeHandlerForObject:(id)object {
    NSArray *allKeys = [self.handlersDictionary allKeys];
    
    for (NSNumber *key in allKeys) {
        [self removeHandlerForState:[key unsignedIntegerValue] object:object];
    }
}

@end