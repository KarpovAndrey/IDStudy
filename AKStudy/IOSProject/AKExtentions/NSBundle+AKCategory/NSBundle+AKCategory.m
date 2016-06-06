//
//  NSBundle+AKCategory.m
//  AKStudy
//
//  Created by Admin on 19.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSBundle+AKCategory.h"

@implementation NSBundle (AKCategory)

+ (NSString *)pathToFileWithName:(NSString *)name {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];
}

@end
