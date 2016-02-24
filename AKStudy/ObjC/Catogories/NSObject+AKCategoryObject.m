//
//  NSObject+AKCategoryObject.m
//  AKStudy
//
//  Created by Admin on 22.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSObject+AKCategoryObject.h"

@implementation NSObject (AKCategoryObject)

+ (instancetype)object {
    return [[[[self class] alloc] init] autorelease];
}

@end
