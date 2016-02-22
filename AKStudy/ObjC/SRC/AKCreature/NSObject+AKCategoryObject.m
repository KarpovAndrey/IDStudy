//
//  NSObject+AKCategoryObject.m
//  AKStudy
//
//  Created by Admin on 22.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSObject+AKCategoryObject.h"

@implementation NSObject(AKCategoryObject)

- (instancetype)object {
    return [[[NSObject alloc] init] autorelease];
}

- (instancetype)init {
    //assert(!self);
    
    return self;
}

@end
