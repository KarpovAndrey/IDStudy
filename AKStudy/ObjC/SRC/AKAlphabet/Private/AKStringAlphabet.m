//
//  AKStringAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKStringAlphabet.h"

@interface AKStringAlphabet ()
@property (nonatomic, copy) NSString *string;

@end

@implementation AKStringAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

-(void) dealloc {
    self.string = nil;
    
    [super dealloc];
}

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.string = string;
    }
    
    return self;
}

- (NSString *)alphabetString {
    return [[self.string copy] autorelease];
}

- (NSUInteger)count {
    return self.alphabetString.length;
}

@end
