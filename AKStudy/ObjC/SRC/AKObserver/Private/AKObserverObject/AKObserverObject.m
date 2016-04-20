//
//  AKObserverObject.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverObject.h"

@implementation AKObserverObject

#pragma mark -
#pragma mark Class Methods

+ (AKObserverObject *)observerObjectWithObject:(id)object handler:(AKObjectHandler)handler {
    return [[AKObserverObject alloc] initWithObject:object handler:handler];
}


# pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithObject:(id)object handler:(AKObjectHandler)handler {
    self = [super init];
    if (self) {
        self.object = object;
        self.handler = handler;
    }
    
    return self;
}

@end
