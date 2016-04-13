//
//  AKObserverObject.m
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserverObject.h"

@interface AKObserverObject ()

@end

@implementation AKObserverObject

- (void)dealloc {
    self.object = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithObject:nil handler:nil];
}

- (instancetype)initWithObject:(id)object handler:(AKObjectHandler)handler {
    self = [super init];
    if (self) {
        self.object = object;
        self.handler = handler;
    }
    
    return self;
}

@end
