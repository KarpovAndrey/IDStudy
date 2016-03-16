//
//  AKCar.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKMoneyProtocol.h"
#import "AKObserver.h"

typedef NS_ENUM(NSUInteger, AKCarState) {
    kAKCarStateUndefined,
    kAKCarStateClean,
    kAKCarStateDirty
};

@protocol AKCarStateProtocol <NSObject>

@optional

- (void)carWashed;
- (void)carSolied;

@end

@class AKCar;

@interface AKCar : AKObserver <AKMoneyProtocol, AKCarStateProtocol>
@property (nonatomic, assign) AKCarState state;

@end
