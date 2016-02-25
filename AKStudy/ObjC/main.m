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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [AKCreatureTest creatureTest];
        NSLog(@"%@", [NSString randomString]);
        NSLog(@"%@", [NSString randomStringCapitalLetters]);
        NSLog(@"%@", [NSString randomStringWithLenght:10]);
        NSLog(@"%@", [NSString randomStringSmallLetters]);
        NSLog(@"%@", [NSString randomStringWithAlphabet:@"qwertyuiop"]);
        NSLog(@"%@", [NSString randomStringWithAlphabet:@"asdfghjkl" Lenght:15]);
        NSLog(@"%@", [NSString randomStringNumbers]);
    }
    return 0;
}
