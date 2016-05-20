//
//  AKStringModel.h
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKObserver.h"

typedef NS_ENUM(NSUInteger, AKArrayModelState) {
    kAKArrayModelUndefinedState,
    kAKArrayModelLoadingState,
    kAKArrayModelChangedState,
    kAKArrayModelLoadedState
};

@interface AKArrayModel : AKObserver <NSFastEnumeration, NSCoding>
@property (nonatomic, readonly) NSUInteger count;

+ (instancetype)arrayModelWithObject:(id)object;
+ (instancetype)arrayModelWithObjects:(NSArray *)objects;

- (instancetype)initWithObject:(id)object;
- (instancetype)initWithObjects:(NSArray *)objects;

- (BOOL)containsObject:(id)object;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)object;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeAllObject;

- (void)exchangeObjectAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

- (void)loadArrayModel;
- (void)saveArrayModel;

@end