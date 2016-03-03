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
    return [NSString randomStringWithAlphabet:[AKAlphabet alphabetsWithUpperCaseLetters] length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithLenght:(NSUInteger)lenght {
    return [NSString randomStringWithAlphabet:[AKAlphabet alphabetsWithUpperCaseLetters] length:lenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type {
    return [NSString randomStringWithType:type length:kAKDefaultLenght];
}

+ (instancetype)randomStringWithType:(AKAlphabetType)type length:(NSUInteger)length {
    NSString *string = nil;
    
    switch (type) {
        case kAKUppercaseLetters: {
            string = [NSString randomStringWithAlphabet: [AKAlphabet alphabetsWithUpperCaseLetters]
                                                 length:length];
            break;
        }
            
        case kAKLowercaseLetters: {
            string = [NSString randomStringWithAlphabet:[AKAlphabet alphabetsWithLowerCaseLetters]
                                                 length:length];
            break;
        }
            
        case kAKNumbers: {
            string = [NSString randomStringWithAlphabet:[AKAlphabet alphabetsWithNumericLetters]
                                                 length:length];
            break;
        }
    }
    
    return string;
}

@end
