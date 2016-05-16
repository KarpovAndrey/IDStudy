//
//  AKObserverDictionary.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverDictionary.h"
#import "AKObserverArray.h"
#import "AKObserverObject.h"

@interface AKObserverDictionary ()
@property (nonatomic, assign) NSUInteger        state;
@property (nonatomic, retain) AKObserverArray   *observerArray;

@end

@implementation AKObserverDictionary

#pragma mark -
#pragma mark Class Methods

+ (AKObserverDictionary *)dictionaryWithState:(NSUInteger)state {
    return [[[AKObserverDictionary alloc] initWithState:state] autorelease];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    [self removeAllHandlers];
    self.observerArray = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithState:0];
}

- (instancetype)initWithState:(NSUInteger)state {
    self = [super init];
    if (self) {
        self.state = state;
        self.observerArray = [[AKObserverArray alloc] init];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)handlers {
    [self.observerArray removeHandlersForObject:nil];
    
    NSMutableArray *handlers = [NSMutableArray array];
    for (AKObserverObject *observer in self.observerArray.handlersObjects) {
        [handlers addObject:observer.handler];
    }
    
    return [[handlers copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addHandler:(AKObjectHandler)handler object:(id)object  {
    AKObserverArray *observerArray = [[AKObserverArray alloc] init];
    [observerArray addHandler:handler forObject:object];
    self.observerArray = observerArray;
}

- (void)removeHandlersForObject:(id)object {
    [self.observerArray removeHandlersForObject:object];
}

- (void)removeAllHandlers {
    [self.observerArray removeAllHandlers];
}

@end
