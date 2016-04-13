//
//  AKObserver.h
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKObjectHandler)(void);

@interface AKObserver : NSObject
@property (nonatomic, assign)   NSUInteger     state;

- (void)addHandler:(AKObjectHandler)handler forState:(NSUInteger)state object:(id)object;
- (void)removeHandlerForState:(NSUInteger)state;
- (void)removeHandlerForObject:(id)object;

@end
