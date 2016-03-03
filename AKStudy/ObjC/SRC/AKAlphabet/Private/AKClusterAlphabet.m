//
//  AKClusterAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKClusterAlphabet.h"

@interface AKClusterAlphabet ()
@property (nonatomic, retain) NSArray *alphabets;

@end

@implementation AKClusterAlphabet
#pragma mark -
#pragma mark Initializations and Deallocations

-(void) dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}
- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
    }
    return self;
}

- (NSString *)alphabetString {
    NSMutableString *mutableString = [NSMutableString string];
    
    for (AKAlphabet *alphabet in self.alphabets) {
        [mutableString appendString:alphabet.alphabetString];
    }
    
    return [[mutableString copy] autorelease];
}

@end
