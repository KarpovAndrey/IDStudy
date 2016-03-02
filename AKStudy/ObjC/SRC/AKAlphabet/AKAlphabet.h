//
//  AKAlphabet.h
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKAlphabet : NSObject

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithSymbols:(NSString *)string;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithString:(NSArray *)strings;
- (instancetype)initWithSymbols:(NSString *)string;

@end
