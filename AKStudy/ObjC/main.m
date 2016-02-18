//
//  main.m
//  ObjC
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKHumanObject.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        -(void)humanTest;
        AKHumanObject *child1 = [[AKHumanObject new] autorelease];
        
        AKHumanObject *child2 = [[AKHumanObject new] autorelease];
        
        AKHumanObject *human = [[[AKHumanObject alloc] initWithName] autorelease];
        [human setAge:40];
        [human setGender:kAKManGender];
        [human setWeight:85];
        [human setChildren: [NSMutableArray arrayWithObjects:child1, child2, nil]];
    }
    return 0;
}