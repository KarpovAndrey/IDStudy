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
#import "AKEnterprise.h"
#import "AKCar.h"
#import "AKBoss.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AKEnterprise *enterprise = [AKEnterprise object];
        NSArray *carsArray = [AKCar objectWithCount:10];
        
        for (AKCar *car in carsArray) {
            [enterprise washCar:car];
        }
        
        NSRunLoop *loop = [NSRunLoop mainRunLoop];
        [loop run];
    }
    
    return 0;
}
