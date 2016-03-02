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
        AKAlphabet *range = [[[AKAlphabet alloc ]initWithRange:NSMakeRange(15, 20)]autorelease];
//        AKAlphabet *alphabet = [AKAlphabet alphabetWithRange:NSMakeRange('A', 'Z')];
//        AKAlphabet *alphabetWithAlphabet = [AKAlphabet alphabetWithAlphabets:@[@"dsadasdsada", @"sdasdasdas"]];
//        AKAlphabet *alphabetWithStrings = [AKAlphabet alphabetWithStrings:@[@"dsfsdfsdfsdf", @"35435345gfdf"]];
        NSLog(@"%@", range);

    }
    return 0;
}
