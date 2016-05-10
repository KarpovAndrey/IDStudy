//
//  AKStringModel.h
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKArrayModel : NSObject
@property (nonatomic, readonly) NSUInteger count;

+ (instancetype)arrayModelWithObject:(id)object;
+ (instancetype)arrayModelWithObjects:(NSArray *)objects;

- (instancetype)initWithObject:(id)object;
- (instancetype)initWithObjects:(NSArray *)objects;

- (BOOL)containsObject:(id)object;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)addObjectToArray;

- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeAllObject;

- (void)exchangeObjectAtIndex:(NSUInteger)sourceIndex withObjectAtIndex:(NSUInteger)destinationIndex;

@end