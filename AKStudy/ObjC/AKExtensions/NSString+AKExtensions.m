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

+ (NSString *)stringWithRange:(NSRange)range;
+ (NSString *)stringWithFirstValue:(NSUInteger)firstValue SecondValue:(NSUInteger)secondValue;
+ (NSString *)stringWithAlphabet:(NSString *)firstAlphabet WithAlphabet:(NSString *)secondAlphabet;

@end

@implementation NSString (AKExtension)

#pragma mark - 
#pragma mark Private Implementation

+ (NSString *)stringWithRange:(NSRange)range {
    NSString *string = [NSString string];
    for (NSUInteger index = range.location; index <range.location +range.length; index++) {
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
    return string;
}

+ (NSString *)stringWithFirstValue:(NSUInteger)firstValue SecondValue:(NSUInteger)secondValue {
    NSRange range = NSMakeRange(firstValue, secondValue - firstValue);
    return [NSString stringWithRange:range];
}

+ (NSString *)stringWithAlphabet:(NSString *)firstAlphabet WithAlphabet:(NSString *)secondAlphabet {
    return [firstAlphabet stringByAppendingString:secondAlphabet];
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet Length:(NSUInteger)length{
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
#pragma mark Class Methods

+ (instancetype)randomString {
    return [NSString stringWithFirstValue:'A' SecondValue:'Z'];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght {
    return [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'A' SecondValue:'Z']
                                       Length:lenght];
}

+ (instancetype)randomStringCapitalLetters {
    return [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'A' SecondValue:'Z']
                                       Length:kAKDefaultLenght];
}

+ (instancetype)randomStringSmallLetters {
    return [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'a' SecondValue:'z']
                                       Length:kAKDefaultLenght];
}

+ (instancetype)randomStringNumbers {
    return [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'0' SecondValue:'9']
                                       Length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithUpperAndLowCases {
    return [NSString randomStringWithAlphabet:[NSString
                           stringWithAlphabet:[NSString stringWithFirstValue:'A' SecondValue:'Z']
                                 WithAlphabet:[NSString stringWithFirstValue:'a' SecondValue:'z']]
                                       Length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type {
    NSString *string;
    
    switch (type) {
        case kAKUppercase:
            string = [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'A' SecondValue:'Z']
                                                 Length:kAKDefaultLenght];
            break;
        case kAKLowercase:
            string = [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'a' SecondValue:'z']
                                                 Length:kAKDefaultLenght];
            break;
        case kAKNumbers:
            string = [NSString randomStringWithAlphabet:[NSString stringWithFirstValue:'0' SecondValue:'9']
                                                 Length:kAKDefaultLenght];
            break;
        case kAKUpperAndLowercases:
            string = [NSString randomStringWithAlphabet:[NSString                                                                                                       stringWithAlphabet:[NSString stringWithFirstValue:'A' SecondValue:'Z']
                      WithAlphabet:[NSString stringWithFirstValue:'a' SecondValue:'z']]
                            Length:kAKDefaultLenght];
            break;
    }
    
    return string;
}

@end
