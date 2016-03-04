//
//  AKRangeAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKRangeAlphabet.h"

@interface AKRangeAlphabet ()
@property (nonatomic, assign) NSRange range;

@end

@implementation AKRangeAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)alphabetString {
    NSMutableString *string = [NSMutableString string];
    NSRange range = self.range;
    NSUInteger location = range.location;
    
    for (NSUInteger index = location; index < location + range.length; index++) {
        [string appendString:[NSString stringWithFormat:@"%c", (unichar)index]];
    }
    
    return [[string copy] autorelease];
}

- (NSUInteger)count {
    return self.range.length;
}

@end
