//
//  NSString+AKExtension.h
//  AKStudy
//
//  Created by Admin on 25.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSUInteger kAKDefaultLenght;

typedef NS_ENUM(NSUInteger, AKAlphabetType) {
    kAKUppercase,
    kAKLowercase,
    kAKNumbers,
    kAKUpperAndLowercases
};

@interface NSString (AKExtension)
//Default alphabet is upper case letters
+ (instancetype)randomString;
+ (instancetype)randomStringWithLenght:(NSUInteger)lenght;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet Length:(NSUInteger)length;

+ (instancetype)randomStringCapitalLetters;
+ (instancetype)randomStringSmallLetters;
+ (instancetype)randomStringNumbers;
+ (instancetype)randomStringWithUpperAndLowCases;

+ (instancetype)randomStringWithType:(AKAlphabetType)type;

@end

