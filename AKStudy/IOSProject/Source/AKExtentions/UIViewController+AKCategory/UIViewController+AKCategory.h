//
//  UIViewController+AKCategory.h
//  AKStudy
//
//  Created by Admin on 25.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AKCategory)

+ (instancetype)controllerFromNibNamed:(NSString *)nibName;
+ (instancetype)defaultControllerFromNib;

@end
