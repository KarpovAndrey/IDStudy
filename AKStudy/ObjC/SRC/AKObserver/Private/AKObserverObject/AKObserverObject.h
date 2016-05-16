//
//  AKObserverObject.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AKObjectHandler)(id object);

@interface AKObserverObject : NSObject
@property (nonatomic, weak)   id              object;
@property (nonatomic, copy)   AKObjectHandler handler;

+ (AKObserverObject *)observerObjectWithObject:(id)object handler:(AKObjectHandler)handler;

- (instancetype)initWithObject:(id)object handler:(AKObjectHandler)handler;

@end
