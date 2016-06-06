//
//  AKObserver.h
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKObjectHandler)(id object);

@interface AKObserver : NSObject
@property (nonatomic, assign)   NSUInteger     state;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addHandler:(AKObjectHandler)handler forState:(NSUInteger)state object:(id)object;
- (void)removeHandlersForState:(NSUInteger)state;
- (void)removeHandlersForObject:(id)object;

@end
