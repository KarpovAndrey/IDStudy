//
//  AKCar.h
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKMoneyProtocol.h"

typedef NS_ENUM(NSUInteger, AKCarState) {
    kAKCarStateUndefined,
    kAKCarStateClean,
    kAKCarStateDirty
};

@class AKCar;

@interface AKCar : NSObject <AKMoneyProtocol>
@property (nonatomic, assign) AKCarState carState;

@end
