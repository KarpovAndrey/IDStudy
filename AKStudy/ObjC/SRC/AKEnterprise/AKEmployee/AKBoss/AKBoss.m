//
//  AKBoss.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKBoss.h"

@implementation AKBoss

- (void)completeWork {
    self.state = kAKEmployeeStateFree;
    NSLog(@"Boss received @%lu$", (unsigned long)self.money);
}

@end
