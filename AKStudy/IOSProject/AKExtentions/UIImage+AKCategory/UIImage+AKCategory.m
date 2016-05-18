//
//  UIImage+AKCategory.m
//  AKStudy
//
//  Created by Admin on 18.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UIImage+AKCategory.h"

@implementation UIImage (AKCategory)

+ (UIImage *)imagePathWithName:(NSString *)name {
    NSString* imagePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];

    return [self imageWithContentsOfFile:imagePath];
}

@end