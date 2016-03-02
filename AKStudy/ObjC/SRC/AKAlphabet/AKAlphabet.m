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

#pragma mark -
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[AKRangeAlphabet alloc] initWithRange:range] autorelease];
}
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[AKClusterAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}
+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[AKStringAlphabet alloc] initWithString:strings] autorelease];
}

+ (instancetype)alphabetWithSymbols:(NSString *)string {
    return [[AKStringAlphabet alloc] initWithString:[string symbols]];
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

- (instancetype)initWithString:(NSArray *)strings {
    [self release];
    
    return [[AKStringAlphabet alloc] initWithString:strings];
}

- (instancetype)initWithSymbols:(NSString *)string {
    [self release];

    return [[AKStringAlphabet alloc] initWithString:[string symbols]];
}




//+ (instancetype)alphabetWithRange:(NSRange)range {
//    return [[[self alloc] initWithRange:range] autorelease];
//}
//

@end
		