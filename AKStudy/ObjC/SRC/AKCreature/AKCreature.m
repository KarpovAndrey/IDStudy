//
//  AKCreature.m
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreature.h"

@interface AKCreature ()
@property(nonatomic, copy)   NSString       *name;
@property(nonatomic, retain) NSMutableArray *childrenArray;
@property(nonatomic, assign) NSUInteger     age;
@property(nonatomic, assign) CGFloat        weight;

@end

@implementation AKCreature

#pragma mark -
#pragma mark Initializations an Deallocations

- (void)dealloc {
    self.name = nil;
    self.childrenArray = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.childrenArray = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [self init];
    if(self){
        self.name = name;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [self.childrenArray copy];
}

#pragma mark -
#pragma mark Public

- (void)addChild:(id)child {
    [self.childrenArray addObject:child];
}

- (void)removeChild:(AKCreature *)child {
    [self.childrenArray removeObject:child];
}

- (void)removeChildren {
    [self.childrenArray removeAllObjects];
}

- (void)sayHello {
    NSLog(@"Hello!");
        for (AKCreature *creature in self.childrenArray) {
            [creature sayHello];
    }
}

- (void)performGenderSpecificOperation {
}

@end

