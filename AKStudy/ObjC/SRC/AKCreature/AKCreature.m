//
//  AKCreature.m
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreature.h"

@interface AKCreature ()
@property(nonatomic, copy)   NSString          *name;
@property(nonatomic, assign) AKCreatureGender  gender;
@property(nonatomic, assign) NSUInteger        age;
@property(nonatomic, assign) CGFloat           weight;
@property(nonatomic, retain) NSMutableArray    *childrenArray;

@end

@implementation AKCreature

- (instancetype)init {
    self = [super init];
    if (self) {
        self.childrenArray = [NSMutableArray array];
        self.gender = arc4random_uniform(2) + 1;
    }
    return self;
}

- (instancetype)initWithName: (NSString *) name {
    self = [super init];
    if(self){
        self.name = name;
    }
    return self;
}

#pragma mark -
#pragma mark Initialisations and deallocations

#pragma mark -
#pragma mark Public

-(NSString *)name: (NSString *) name {
    return self.name = name;
}

-(NSArray *)children {
    return [self.childrenArray copy];
}

- (void)addChild:(id)child {
    [self.childrenArray addObject:child];
}

-(void)removeChild: (AKCreature *) child {
    [self.childrenArray removeObject:child];
}

-(void)sayHello{
    NSLog(@"Hello!");
    if (self.childrenArray) {
        for (NSUInteger i = 0; i < [self.childrenArray count]; i++) {
            [self.childrenArray[i] sayHello];
        }
    }
}

-(AKCreature *)giveBirthToChild {
    AKCreature *child = [[[AKCreature alloc] init] autorelease];
    NSLog(@"OOOOOooo I'm giving birth");
    return child;
}

-(void)goToWar{
    NSLog(@"I am a man, I going to war");
}

@end

