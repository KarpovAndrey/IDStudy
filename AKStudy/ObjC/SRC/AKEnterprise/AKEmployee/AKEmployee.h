//
//  AKEmployee.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKMoneyProtocol.h"
#import "AKWorkerProtocol.h"

#import "AKQueue.h"
#import "AKObserver.h"

@class AKEmployee;

@interface AKEmployee : AKObserver <AKMoneyProtocol, AKWorkerProtocol>
@property (nonatomic, readonly) AKQueue *queue;

+ (NSArray *)employeesWithCount:(NSUInteger)count observers:(NSArray *)observers;

- (void)performWorkWithObject:(id<AKMoneyProtocol>)object;

@end
