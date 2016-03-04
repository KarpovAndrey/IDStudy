//
//  AKAlphabet.h
//  AKStudy
//
//  Created by Admin on 29.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKAlphabet : NSObject
@property (nonatomic, readonly) NSString   *alphabetString;
@property (nonatomic, readonly) NSUInteger count;

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithString:(NSString *)string;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithCharactersRange:(unichar)firstValue lastValue:(unichar)lastValue;

+ (instancetype)upperCaseLettersAlphabet;
+ (instancetype)lowerCaseLettersAlphabet;
+ (instancetype)numericLettersAlphabet;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithString:(NSString *)string;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithCharactersRange:(unichar)firstValue lastValue:(unichar)lastValue;

@end
