//
//  AKObserverObject.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKObserver.h"

@interface AKObserverObject : NSObject
@property (nonatomic, retain) id              object;
@property (nonatomic, copy)   AKObjectHandler handler;

- (instancetype)initWithObject:(id)object handler:(AKObjectHandler)handler NS_DESIGNATED_INITIALIZER;

@end
