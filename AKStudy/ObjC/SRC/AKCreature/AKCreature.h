//
//  AKCreature.h
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKCreature : NSObject
@property(nonatomic, readonly) NSString   *name;
@property(nonatomic, readonly) NSArray    *children;
@property(nonatomic, readonly) NSUInteger age;
@property(nonatomic, readonly) CGFloat    weight;

- (instancetype)initWithName:(NSString *)name;

- (void)addChild:(id)child;
- (void)removeChild:(AKCreature *)child;
- (void)removeChildren;
- (void)sayHello;
- (void)performGenderSpecificOperation;

@end