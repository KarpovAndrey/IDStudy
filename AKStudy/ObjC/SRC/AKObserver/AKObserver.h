//
//  AKObserver.h
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKObserver : NSObject
@property (nonatomic, assign)   NSUInteger state;
@property (nonatomic, readonly) NSArray    *observers;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;

// This method is intended for subclassing
- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObservers;
- (void)notifyObserversWithSelector:(SEL)selector;
- (BOOL)isObservedByObject:(id)object;

@end
