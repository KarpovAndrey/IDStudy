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

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
}

@end
