//
//  UIViewController+AKCategory.m
//  AKStudy
//
//  Created by Admin on 25.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UIViewController+AKCategory.h"

@implementation UIViewController (AKCategory)

+ (instancetype)controllerFromNibNamed:(NSString *)nibName {
    return [[[self class] alloc] initWithNibName:nibName
                                          bundle:[NSBundle mainBundle]];
}

+ (instancetype)defaultControllerFromNib {
    return [self controllerFromNibNamed:NSStringFromClass([self class])];
}

@end