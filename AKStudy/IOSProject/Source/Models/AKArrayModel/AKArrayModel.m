//
//  AKArrayModel.m
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKArrayModel.h"
#import "AKStringModel.h"

@interface AKArrayModel ()
@property (nonatomic, strong) NSMutableArray *arrayObjects;

@end

@implementation AKArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)arrayModelWithObject:(id)object {
    return [[self alloc] initWithObject:object];
}

+ (instancetype)arrayModelWithObjects:(NSArray *)objects {
    return [[self alloc] initWithObjects:objects, nil];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.arrayObjects = [NSMutableArray arrayWithObject:object];
    }
    
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        self.arrayObjects = [NSMutableArray arrayWithArray:objects];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.arrayObjects.count;
}

#pragma mark -
#pragma mark Public Methods

- (BOOL)containsObject:(id)object {
    return [self containsObject:object];
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.arrayObjects objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.arrayObjects[index];
}

- (void)removeObject:(id)object {
    [self.arrayObjects removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    return [self.arrayObjects removeObjectAtIndex:index];
}

- (void)removeAllObject {
    [self.arrayObjects removeAllObjects];
}


- (void)exchangeObjectAtIndex:(NSUInteger)sourceIndex withObjectAtIndex:(NSUInteger)destinationIndex {
    [self.arrayObjects exchangeObjectAtIndex:sourceIndex
                           withObjectAtIndex:destinationIndex];
}
@end
