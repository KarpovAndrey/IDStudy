//
//  NSString+AKExtension.h
//  AKStudy
//
//  Created by Admin on 25.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AKAlphabet;

extern const NSUInteger kAKDefaultLenght;

typedef NS_ENUM(NSUInteger, AKAlphabetType) {
    kAKUppercaseLetters,
    kAKLowercaseLetters,
    kAKNumbers,
};

@interface NSString (AKExtension)
//Default alphabet is upper case letters
//Default alphabet length = 20 symbols
+ (instancetype)randomString;
+ (instancetype)randomStringWithLenght:(NSUInteger)lenght;
+ (instancetype)randomStringWithAlphabet:(AKAlphabet *)alphabet length:(NSUInteger)length;

+ (instancetype)randomStringWithType:(AKAlphabetType)type;
+ (instancetype)randomStringWithType:(AKAlphabetType)type length:(NSUInteger)length;

//Default quantity determined with arc4random_uniform(50) + 1
+ (NSArray *)randomStringsWithCount:(NSUInteger)count;
+ (NSArray *)randomStrings;

@end

