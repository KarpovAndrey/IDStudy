//
//  AKWorkerProtocol.h
//  AKStudy
//
//  Created by Admin on 12.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, AKWorkerBusyness) {
    kAKWorkerUndefined,
    kAKWorkerFree,
    kAKWorkerBusy
};

@protocol AKWorkerProtocol <NSObject>
@property (nonatomic, assign) AKWorkerBusyness busyness;

- (void)workerDidFinishWorkWithObject:(id<AKMoneyProtocol>)object;

@end
