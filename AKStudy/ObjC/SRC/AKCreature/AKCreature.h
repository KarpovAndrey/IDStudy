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
@property(nonatomic, readonly) NSString          *name;
//@property(nonatomic, readonly) AKCreatureGender  gender;
@property(nonatomic, readonly) NSUInteger        age;
@property(nonatomic, readonly) CGFloat           weight;
@property(nonatomic, readonly) NSArray           *children;

- (instancetype)initWithName:(NSString *) name;

- (NSString *)name:(NSString *) name;

- (NSArray *)children;

- (void)addChild:(id)child;

- (void)removeChild:(AKCreature *) child;

- (void)sayHello;

//- (AKCreature *)giveBirthToChild;
//
//- (void)goToWar;

- (void)performGenderSpecificOperation;

+ (AKCreature *)objectCreate;

@end