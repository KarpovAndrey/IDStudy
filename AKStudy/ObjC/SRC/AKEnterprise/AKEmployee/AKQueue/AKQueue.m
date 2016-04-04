//
//  AKQueue.m
//  AKStudy
//
//  Created by Admin on 03.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKQueue.h"

@interface AKQueue ()
@property (nonatomic, retain) NSMutableArray *queueArray;

@end

@implementation AKQueue

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    [self.queueArray removeAllObjects];
    self.queueArray = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queueArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)queue {
    return [[self.queueArray copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)pushObject:(id)object {
    [self.queueArray addObject:object];
}

- (id)popObject {
    id object = [self.queueArray firstObject];
    
    if (object) {
        [self.queueArray removeObject:object];
    }
    
    return object;
}

@end
