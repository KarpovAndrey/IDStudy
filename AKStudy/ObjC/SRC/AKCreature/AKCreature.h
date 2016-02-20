//
//  AKCreature.h
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kAKUndefined,
    kAKManGender,
    kAKWomanGender
} AKCreatureGender;

@interface AKCreature : NSObject
@property(nonatomic, readonly) NSString          *name;
@property(nonatomic, readonly) AKCreatureGender  gender;
@property(nonatomic, readonly) NSUInteger        age;
@property(nonatomic, readonly) CGFloat           weight;
@property(nonatomic, readonly) NSArray           *children;

- (instancetype)initWithName: (NSString *) name;

- (NSString *)name: (NSString *) name;

- (NSArray *)children;

- (void)addChild:(id)child;

- (void)removeChild: (AKCreature *) child;

- (AKCreature *)giveBirthToChild;

- (void)sayHello;

- (void)goToWar;

@end