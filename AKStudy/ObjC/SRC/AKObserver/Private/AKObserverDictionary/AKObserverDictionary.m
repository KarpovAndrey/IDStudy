//
//  AKObserverDictionary.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverDictionary.h"

@interface AKObserverDictionary ()

@end

@implementation AKObserverDictionary

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    self.arrayObjects = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.arrayObjects = [AKObserverArray object];
    }
    
    return self;
}

- (void)addHandler:(AKObjectHandler)handler forstate:(NSUInteger)state object:(id)object  {
    AKObserverArray *observerArray = [AKObserverArray object];
    [observerArray addHandler:handler forObject:object];
    self.state = state;
    self.arrayObjects = observerArray;
}

- (void)removeHandlersForObject:(id)object {
    [self.arrayObjects removeHandlersForObject:object];
}

@end
