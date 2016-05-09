//
//  AKStringsModel.m
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKStringsModel.h"
#import "AKRandomStringModel.h"

static const NSUInteger kAKDefaultQuantityStringsMax = 40;

@interface AKStringsModel ()

- (void)addRandomStringModels;

@end

@implementation AKStringsModel

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.stringsModels = [NSMutableArray array];
        [self addRandomStringModels];
    }
    
    return self;
}

#pragma marl -
#pragma mark Private Methods

- (void)addRandomStringModels {
    NSUInteger count = arc4random_uniform(kAKDefaultQuantityStringsMax) + 1;
    for (NSUInteger index = 0; index < count; index++) {
        [self.stringsModels addObject:[AKRandomStringModel new]];
    }
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
    return self.stringsModels.count;
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.stringsModels objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.stringsModels[index];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    self.stringsModels[index] = object;
}

- (NSString *)stringFromObjectAtIndex:(NSUInteger)index {
    AKRandomStringModel *object = [self objectAtIndex:index];
    
    return object.randomString;
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    return [self.stringsModels removeObjectAtIndex:index];
}

@end
