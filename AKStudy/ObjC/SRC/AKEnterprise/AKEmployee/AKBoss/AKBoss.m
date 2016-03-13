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

- (void)performWorkWithObject:(id)object {
    [super performWorkWithObject:object];
    
    NSLog(@"%@ received @%lu$", self, self.money);
}

@end
