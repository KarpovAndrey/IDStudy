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
//Default alphabet length = 20 symbols
+ (instancetype)randomString;
+ (instancetype)randomStringWithLenght:(NSUInteger)lenght;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet length:(NSUInteger)length;

+ (instancetype)randomStringWithType:(AKAlphabetType)type;
+ (instancetype)randomStringWithType:(AKAlphabetType)type length:(NSUInteger)length;

@end

