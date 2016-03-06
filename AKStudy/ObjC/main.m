//
//  main.m
//  ObjC
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKCreatureTest.h"
#import "NSString+AKExtensions.h"
#import "AKAlphabet.h"
#import "AKRangeAlphabet.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AKAlphabet *alphabet1 = [[[AKAlphabet alloc] initWithRange:NSMakeRange(65, 20)]autorelease];
     
        for (NSString *symbol in alphabet1) {
//            if ([symbol  isEqual: @"B"]) {
                NSLog(@"%@", symbol);
//            }
        }
        
        //        NSLog(@"%@", alphabet2.alphabetString);
//        NSLog(@"%lu", (unsigned long)alphabet2.count);
//
//        NSLog(@"%@", [NSString randomStringWithType:kAKLowercaseLetters length:111]);
//        AKAlphabet *alphabet = [AKAlphabet alphabetWithRange:NSMakeRange('A', 'Z')];
//        AKAlphabet *alphabetWithAlphabet = [AKAlphabet alphabetWithAlphabets:@[@"dsadasdsada", @"sdasdasdas"]];
//        AKAlphabet *alphabetWithStrings = [AKAlphabet alphabetWithStrings:@[@"dsfsdfsdfsdf", @"35435345gfdf"]];
//        NSLog(@"%lu", alphabet.count);
//        NSLog(@"%lu", (unsigned long)alphabet1.count);
//        NSLog(@"%lu", (unsigned long)alphabet2.count);

    }
    
    return 0;
}
