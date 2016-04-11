//
//  AKObserver.h
//  AKStudy
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AKEmployeeHandler)(void);

@interface AKObserver : NSObject
@property (nonatomic, assign)   NSUInteger     state;
@property (nonatomic, retain)   NSMutableDictionary *handlersDictionary;

- (void)addHandler:(AKEmployeeHandler)employeeHandler forState:(NSUInteger)state object:(id)object;
- (void)removeHandlerForState:(NSUInteger)state object:(id)object;
- (void)removeHandlerForObject:(id)object;

@end
