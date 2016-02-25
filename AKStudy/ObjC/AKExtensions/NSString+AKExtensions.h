//
//  NSString+AKExtension.h
//  AKStudy
//
//  Created by Admin on 25.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AKExtension)

+ (instancetype)randomString;
+ (instancetype)randomStringWithLenght:(NSUInteger)lenght;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet
                                  Lenght:(NSUInteger)lenght;
+ (instancetype)randomStringCapitalLetters;
+ (instancetype)randomStringSmallLetters;
+ (instancetype)randomStringNumbers;

@end

