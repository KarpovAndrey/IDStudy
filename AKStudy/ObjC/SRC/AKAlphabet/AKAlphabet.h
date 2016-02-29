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
- (instancetype)initWithRange:(NSRange)range;

@end
