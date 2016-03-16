//
//  AKBoss.m
//  AKStudy
//
//  Created by Admin on 10.03.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKBoss.h"

@interface AKBoss ()

@end

@implementation AKBoss

- (void)completeWorkWithObject:(AKEmployee *)object {
    object.state = kAKEmployeeStateFree;
    NSLog(@"%@ received @%lu$", self, self.money);
    self.state = kAKEmployeeStateFree;
}

@end
