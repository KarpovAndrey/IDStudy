//
//  AKCreature.h
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AKCreatureGender) {
    kAKUndefined,
    kAKManGender,
    kAKWomanGender
};

@interface AKCreature : NSObject
@property(nonatomic, readonly) NSString   *name;
@property(nonatomic, readonly) NSArray    *children;
@property(nonatomic, readonly) NSUInteger age;
@property(nonatomic, readonly) CGFloat    weight;

+ (instancetype)creature;

- (instancetype)initWithName:(NSString *)name;

- (void)addChild:(id)child;
- (void)removeChild:(AKCreature *)child;
- (void)removeChildren;
- (void)sayHello;
- (void)performGenderSpecificOperation;

@end