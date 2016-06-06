//
//  AKObserverDictionary.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKObjectHandler)(id object);

@class AKObserverArray;

@interface AKObserverDictionary : NSObject
@property (nonatomic, readonly) NSUInteger      state;
@property (nonatomic, readonly) NSArray         *handlers;

+ (AKObserverDictionary *)dictionaryWithState:(NSUInteger)state;

- (instancetype)initWithState:(NSUInteger)state NS_DESIGNATED_INITIALIZER;

- (void)addHandler:(AKObjectHandler)handler object:(id)object;
- (void)removeHandlersForObject:(id)object;
- (void)removeAllHandlers;

@end
