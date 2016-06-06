//
//  AKObserverArray.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKObjectHandler)(id object);

@interface AKObserverArray : NSObject
@property (nonatomic, readonly) NSArray *handlersObjects;

- (void)addHandler:(AKObjectHandler)handler forObject:(id)object;
- (void)removeHandlersForObject:(id)object;
- (void)removeAllHandlers;

@end
