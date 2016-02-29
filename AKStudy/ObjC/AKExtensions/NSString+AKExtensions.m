//
//  NSString+AKExtension.m
//  AKStudy
//
//  Created by Admin on 25.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSString+AKExtensions.h"

const NSUInteger kAKDefaultLenght = 20;

@interface NSString (AKExtensions)

+ (NSString *)alphabetWithRange:(NSRange)range;
+ (NSString *)alphabetWithRangeWithCharacterRangeFirstValue:(unichar)firstValue
                                                secondValue:(unichar)secondValue;

@end

@implementation NSString (AKExtension)

#pragma mark -
#pragma mark Private Class Methods

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet length:(NSUInteger)length{
    NSString *string = [NSString string];
    
    for (NSUInteger index = 0; index < length; index++) {
        uint32_t alphabetLenght = (uint32_t) alphabet.length - 1;
        NSUInteger randomInteger = arc4random_uniform(alphabetLenght);
        
        unichar randomChar = [alphabet characterAtIndex:randomInteger];
        NSString *charString = [NSString stringWithFormat:@"%c", randomChar];
        string = [string stringByAppendingString:charString];
    }
    
    return string;
}

#pragma mark -
#pragma mark Public Class Methods

+ (instancetype)randomString {
    return [NSString randomStringWithAlphabet:[NSString uppercaseAlphabet] length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght {
    return [NSString randomStringWithAlphabet:[NSString uppercaseAlphabet] length:lenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type {
    return [NSString randomStringWithType:type length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type length:(NSUInteger)length {
    NSString *string = nil;
    
    switch (type) {
        case kAKUppercase: {
            string = [NSString randomStringWithAlphabet: [NSString uppercaseAlphabet]
                                                 length:length];
            break;
        }
            
        case kAKLowercase: {
            string = [NSString randomStringWithAlphabet:[NSString lowerrcaseAlphabet]
                                                 length:length];
            break;
        }
            
        case kAKNumbers: {
            string = [NSString randomStringWithAlphabet:[NSString numericAlphabet]
                                                 length:length];
            break;
        }
            
        case kAKUpperAndLowercases: {
            NSString *uppercaseAlphabet = [NSString uppercaseAlphabet];
            NSString *lowercaseAlphabet = [NSString uppercaseAlphabet];
            string = [NSString randomStringWithAlphabet:
                      [uppercaseAlphabet stringByAppendingString:lowercaseAlphabet]
                                                 length:length];
            break;
        }
    }
    
    return string;
}

#pragma mark -
#pragma mark Alphabets

+ (NSString *)alphabetWithRange:(NSRange)range {
    NSString *string = [NSString string];
    for (NSUInteger index = range.location; index <range.location +range.length; index++) {
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
    return string;
}

+ (NSString *)alphabetWithRangeWithCharacterRangeFirstValue:(unichar)firstValue
                                                secondValue:(unichar)secondValue
{
    NSRange range = NSMakeRange(firstValue, secondValue - firstValue);
    return [NSString alphabetWithRange:range];
}

+ (instancetype)uppercaseAlphabet {
    return [NSString alphabetWithRangeWithCharacterRangeFirstValue:'A' secondValue:'Z'];
}

+ (instancetype)lowerrcaseAlphabet {
    return [NSString alphabetWithRangeWithCharacterRangeFirstValue:'a' secondValue:'z'];
}

+ (instancetype)numericAlphabet {
    return [NSString alphabetWithRangeWithCharacterRangeFirstValue:'0' secondValue:'9'];
}

@end
