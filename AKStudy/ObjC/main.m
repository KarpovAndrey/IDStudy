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
//        AKAlphabet *alphabet = [[[AKAlphabet alloc ]initWithRange:NSMakeRange(65, 20)]autorelease];
        AKAlphabet *alphabet1 = [[AKAlphabet alloc ]initWithString:@"dsfgfdgdfgdf"];
        AKAlphabet *alphabet2 = [[AKAlphabet alloc ]initWithCharactersRange:'A' lastValue:'Z'];
        AKAlphabet *alphabet3 = [[AKAlphabet alloc ]initWithAlphabets:@[alphabet1, alphabet2]];

        NSLog(@"%@", alphabet3.alphabetString);
        NSLog(@"%d", alphabet3.count);

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
