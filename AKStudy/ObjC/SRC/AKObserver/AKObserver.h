//
//  AKObserver.h
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKEmployeeHandler)(void);

@interface AKObserver : NSObject
@property (nonatomic, assign)   NSUInteger     state;
@property (nonatomic, readonly) NSArray        *observers;
@property (nonatomic, retain)   NSMutableDictionary *handlersDictionary;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

- (void)addBlockForState:(AKEmployeeHandler)employeeBlock state:(NSUInteger)state;
- (void)removeBlockForState:(NSUInteger)state;

// This method is intended for subclassing
- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObservers;
- (void)notifyObserversWithSelector:(SEL)selector;
- (BOOL)isObservedByObject:(id)object;

@end
