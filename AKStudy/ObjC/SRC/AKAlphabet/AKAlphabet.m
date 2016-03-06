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
    return [[[self alloc] initWithRange:NSMakeRange(firstValue, lastValue - firstValue + 1)] autorelease];
}

#pragma mark - 
#pragma mark Alphabets

+ (instancetype)upperCaseLettersAlphabet {
    return [self alphabetWithCharactersRange:'A' lastValue:'Z'];
}

+ (instancetype)lowerCaseLettersAlphabet {
    return [self alphabetWithCharactersRange:'a' lastValue:'z'];
}

+ (instancetype)numericLettersAlphabet {
    return [self alphabetWithCharactersRange:'0' lastValue:'9'];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    [self autorelease];
    
    return [[AKRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self autorelease];
    
    return [[AKClusterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithString:(NSString *)string {
    [self autorelease];
    
    return [[AKStringAlphabet alloc] initWithString:string];
}

- (instancetype)initWithCharactersRange:(unichar)firstValue lastValue:(unichar)lastValue {
    [self autorelease];

    return [[AKRangeAlphabet alloc] initWithRange:NSMakeRange(firstValue, lastValue - firstValue)];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)alphabetString {
    return nil;
}

- (NSUInteger)count {
    return self.alphabetString.length;
}
#pragma mark -
#pragma mark NSFastEnumeration

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [NSString stringWithFormat:@"%c", [self.alphabetString characterAtIndex:index]];
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)len
{
    state->mutationsPtr = (unsigned long *) self;
    NSUInteger stateCount = state->state;
    NSUInteger length = self.count - stateCount;
    length = MIN(length, len);
    
    for (NSUInteger index = stateCount; index < stateCount + length; index++) {
        buffer[index] = self[index];
    }
    
    state->state = stateCount + length;
    
    state->itemsPtr = buffer;
    
    return length;
}

@end
		