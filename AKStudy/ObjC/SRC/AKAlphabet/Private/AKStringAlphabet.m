//
//  AKStringAlphabet.m
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKStringAlphabet.h"

@interface AKStringAlphabet ()
@property (nonatomic, assign) NSArray *strings;

@end

@implementation AKStringAlphabet

- (instancetype)initWithString:(NSArray *)strings {
    self = [super init];
    if (self) {
        self.strings = strings;
    }
    
    return self;
}

@end
