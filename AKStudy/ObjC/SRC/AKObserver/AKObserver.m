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
                    for (AKObserverObject *observer in observerDictionary.arrayObjects.handlersObject) {
                        observer.handler();
                    }
                }
            }
            
//            NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:_state];
//            AKObjectHandler employeeHandler = [self.handlersDictionary objectForKey:keyNumber];
//            if (employeeHandler) {
//                employeeHandler();
//            }
    
            
            
//            NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:_state];
//            NSMutableArray *array = [self.handlersDictionary objectForKey:keyNumber];
//                for (AKObjectHandler employeeHandler in array) {
//                    employeeHandler();
//                }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler forState:(NSUInteger)state object:(id)object {
    AKObserverDictionary *dictionary = [AKObserverDictionary object];
    [dictionary addHandler:handler forstate:state object:object];
    [self.observers addObject:dictionary];
    
//    [self removeHandlerForState:state];
//    
//    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
//    [self.handlersDictionary setObject:[[employeeHandler copy] autorelease] forKey:keyNumber];
    
    
//    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
//    NSMutableArray *array = [self.handlersDictionary objectForKey:keyNumber];
//    if (!array) {
//        array = [NSMutableArray array];
//    }
//    
//    [array addObject:[[employeeHandler copy] autorelease]];
//    [self.handlersDictionary setObject:array forKey:keyNumber];
}

- (void)removeHandlerForState:(NSUInteger)state {
//    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
//    [self.arrayDictionary removeObjectForKey:keyNumber];
    
//    NSNumber *keyNumber = [NSNumber numberWithUnsignedInteger:state];
//    NSMutableArray *array = [self.handlersDictionary objectForKey:keyNumber];
//    [array removeAllObjects];
}
//
//- (void)removeHandlerForObject:(id)object {
//    NSArray *allKeys = [self.handlersDictionary allKeys];
//    
//    for (NSNumber *key in allKeys) {
//        [self removeHandlerForState:[key unsignedIntegerValue] object:object];
//    }
//}

@end