//
//  NSObject+AKCategoryObject.m
//  AKStudy
//
//  Created by Admin on 22.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSObject+AKExtensions.h"

@implementation NSObject (AKCategory)

+ (instancetype)object {
    return [[[[self class] alloc] init] autorelease];
}

+ (NSArray *)objectWithCount:(NSUInteger)count {
    NSMutableArray *array = [NSMutableArray object];
    for (NSUInteger index = 0; index < count; index++) {
        [array addObject:[self object]];
    }
    
    return [[array copy] autorelease];
}

@end
