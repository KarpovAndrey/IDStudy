//
//  AKRangeAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKRangeAlphabet.h"

@interface AKRangeAlphabet ()
//@property (nonatomic, assign) NSRange range;
@property (nonatomic, copy) NSString *string;

+ (instancetype)stringWithCharactersInRange:(unichar)firstValue secondValue:(unichar)secondValue;
@end

@implementation AKRangeAlphabet

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self = [AKRangeAlphabet stringWithCharactersInRange:range.location
                                                secondValue:(range.location + range.length)];
    }
    
    return self;
}

+ (instancetype)alphabetWithRange:(NSRange)range {
    AKRangeAlphabet *alphabet = [[[AKRangeAlphabet alloc] init] autorelease];
    NSString *string = [NSMutableString string];
    NSUInteger location = range.location;
    
    for (NSUInteger index = location; index < location + range.length; index++) {
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
    alphabet.string = [[string copy] autorelease];
    
    return alphabet;
}

+ (instancetype)stringWithCharactersInRange:(unichar)firstValue secondValue:(unichar)secondValue {
    return [AKRangeAlphabet alphabetWithRange:NSMakeRange((unichar)firstValue, (unichar)(secondValue - firstValue))];
}


@end
