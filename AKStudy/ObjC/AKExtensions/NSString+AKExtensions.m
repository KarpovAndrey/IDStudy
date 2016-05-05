//
//  NSString+AKExtension.m
//  AKStudy
//
//  Created by Admin on 25.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSString+AKExtensions.h"

#import "AKAlphabet.h"

const NSUInteger kAKDefaultLenght          = 20;
const NSUInteger kAKDefaultQuantityStringsMax = 50;

@interface NSString (AKExtensions)

@end

@implementation NSString (AKExtension)

#pragma mark -
#pragma mark Public Class Methods

+ (instancetype)randomStringWithAlphabet:(AKAlphabet *)alphabet length:(NSUInteger)length{
    NSMutableString *string = [NSMutableString string];
    
    for (NSUInteger index = 0; index < length; index++) {
        NSUInteger randomInteger = arc4random_uniform((uint32_t)alphabet.count - 1);
        unichar randomChar = [alphabet.alphabetString characterAtIndex:randomInteger];
        NSString *charString = [NSString stringWithFormat:@"%c", randomChar];
        [string appendString:charString];
    }
    
    return [[string copy] autorelease];
}

+ (instancetype)randomString {
    return [NSString randomStringWithAlphabet:[AKAlphabet upperCaseLettersAlphabet] length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght {
    return [NSString randomStringWithAlphabet:[AKAlphabet upperCaseLettersAlphabet] length:lenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type {
    return [NSString randomStringWithType:type length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type length:(NSUInteger)length {
    NSString *string = nil;
    
    switch (type) {
        case kAKUppercaseLetters: {
            string = [NSString randomStringWithAlphabet: [AKAlphabet upperCaseLettersAlphabet]
                                                 length:length];
            break;
        }
            
        case kAKLowercaseLetters: {
            string = [NSString randomStringWithAlphabet:[AKAlphabet lowerCaseLettersAlphabet]
                                                 length:length];
            break;
        }
            
        case kAKNumbers: {
            string = [NSString randomStringWithAlphabet:[AKAlphabet numericLettersAlphabet]
                                                 length:length];
            break;
        }
    }
    
    return string;
}

+ (NSArray *)randomStringsWithCount:(NSUInteger)count {
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < count; index++) {
        [mutableArray addObject:[NSString randomString]];
    }
    
    return [mutableArray copy];
}

+ (NSArray *)randomStrings {
    return [self randomStringsWithCount:arc4random_uniform(kAKDefaultQuantityStringsMax) + 1];
}

@end
