//
//  AKAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKAlphabet.h"
#import "AKRangeAlphabet.h"
#import "AKStringAlphabet.h"
#import "AKClusterAlphabet.h"

#import "NSString+AKExtensions.h"

@implementation AKAlphabet

@dynamic alphabetString;
@dynamic count;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[self alloc] initWithRange:range] autorelease];
}
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[self alloc] initWithAlphabets:alphabets] autorelease];
}
+ (instancetype)alphabetWithString:(NSString *)string {
    return [[[self alloc] initWithString:string] autorelease];
}

+ (instancetype)alphabetWithCharactersRange:(unichar)firstValue lastValue:(unichar)lastValue {
    return [[[self alloc] initWithCharactersRange:firstValue lastValue:lastValue] autorelease];
}

#pragma mark - 
#pragma mark Alphabets

+ (instancetype)alphabetsWithUpperCaseLetters {
    return [self alphabetWithCharactersRange:'A' lastValue:'Z'];
}

+ (instancetype)alphabetsWithLowerCaseLetters {
    return [self alphabetWithCharactersRange:'a' lastValue:'z'];
}

+ (instancetype)alphabetsWithNumericLetters {
    return [self alphabetWithCharactersRange:'0' lastValue:'9'];
}


#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    [self autorelease];
    
    return [[AKRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[AKClusterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithString:(NSString *)string {
    [self release];
    
    return [[AKStringAlphabet alloc] initWithString:string];
}

- (instancetype)initWithCharactersRange:(unichar)firstValue lastValue:(unichar)lastValue {
    [self release];

    return [[AKRangeAlphabet alloc] initWithCharactersRange:firstValue lastValue:lastValue];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)alphabetString {
    return nil;
}

- (NSUInteger)count {
    return self.alphabetString.length;
}

@end
		