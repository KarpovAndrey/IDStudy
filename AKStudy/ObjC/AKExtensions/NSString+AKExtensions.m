//
//  NSString+AKExtension.m
//  AKStudy
//
//  Created by Admin on 25.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSString+AKExtensions.h"

static const NSUInteger kAKDefaultLenght           = 20;

static const NSUInteger kAKStartValueCapitalLetters = 65;
static const NSUInteger kAKStartValueSmallLetters   = 97;
static const NSUInteger kAKStartValueNumbers        = 48;

static const NSUInteger kAKDefaultRangeLetters      = 25;
static const NSUInteger kAKDefaultRangeLNumbers     = 10;


@interface NSString ()

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght
                             Range:(NSUInteger)range
                             StartValue:(NSUInteger)value;

@end

@implementation NSString (AKExtension)

+ (instancetype)randomString {
    return [NSString randomStringWithLenght:kAKDefaultLenght];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght {
    return [NSString randomStringWithLenght:lenght
                                  Range:kAKDefaultRangeLetters
                             StartValue:kAKStartValueSmallLetters];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght
                             Range:(NSUInteger)range
                        StartValue:(NSUInteger)value
{
    NSString *string = [NSString string];
    
    for (NSUInteger index = 0; index < lenght; index++) {
        uint32_t randomInteger = arc4random_uniform((uint32_t)range) + (uint32_t)value;
        unichar randomChar = randomInteger;
        NSString *charString = [NSString stringWithFormat:@"%c", randomChar];
        string = [string stringByAppendingString:charString];
    }
//
//    NSString *alphabet = [NSString string];
//    for (NSUInteger index = KAKDefaultStartValue; index < KAKDefaultStartValue + KAKDefaultRangeLetter; index++) {
//        unichar charValue = index;
//        NSString *charString = [NSString stringWithFormat:@"%c", charValue];
//        alphabet = [alphabet stringByAppendingString:charString];
//    }
//    
//    return [NSString randomStringWithAlphabet:alphabet Lenght:lenght];
    return string;
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet {
    return [NSString randomStringWithAlphabet:alphabet Lenght:kAKDefaultLenght];
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet
                                  Lenght:(NSUInteger)lenght
{
    NSString *string = [NSString string];
    
    for (NSUInteger index = 0; index < lenght; index++) {
        uint32_t alphabetLenght = (uint32_t) alphabet.length - 1;
        NSUInteger randomInteger = arc4random_uniform(alphabetLenght);
        
        unichar randomChar = [alphabet characterAtIndex:randomInteger];
        NSString *charString = [NSString stringWithFormat:@"%c", randomChar];
        string = [string stringByAppendingString:charString];
    }
    
    return string;
}

+ (instancetype)randomStringCapitalLetters {
    return [NSString randomStringWithLenght:kAKDefaultLenght
                                  Range:kAKDefaultRangeLetters
                             StartValue:kAKStartValueCapitalLetters];
    
}

+ (instancetype)randomStringSmallLetters {
    return [NSString randomStringWithLenght:kAKDefaultLenght
                                  Range:kAKDefaultRangeLetters
                             StartValue:kAKStartValueSmallLetters];
}

+ (instancetype)randomStringNumbers {
    return [NSString randomStringWithLenght:kAKDefaultLenght
                                  Range:kAKDefaultRangeLNumbers
                             StartValue:kAKStartValueNumbers];
}

@end
