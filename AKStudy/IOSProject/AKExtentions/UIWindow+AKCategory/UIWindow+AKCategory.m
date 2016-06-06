//
//  UIWindow+AKCategory.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UIWindow+AKCategory.h"

@implementation UIWindow (AKCategory)

+ (UIWindow *)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
