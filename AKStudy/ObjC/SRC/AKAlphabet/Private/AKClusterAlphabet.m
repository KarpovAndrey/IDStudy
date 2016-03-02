//
//  AKClusterAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKClusterAlphabet.h"

@interface AKClusterAlphabet ()
@property (nonatomic, assign) NSArray *alphabets;

@end

@implementation AKClusterAlphabet

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
    }
    return self;
}

@end
