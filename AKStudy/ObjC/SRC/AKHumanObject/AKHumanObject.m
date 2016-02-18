//
//  AKHumanObject.m
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKHumanObject.h"

@implementation AKHumanObject

- (instancetype)initWithName {
    self = [super init];
    if(self){
        self.name = @"Dodik";
    }
    return self;
}

#pragma mark -
#pragma mark Initialisations and deallocations

#pragma mark -
#pragma mark Public

-(void)sayHello {
    NSLog(@"Hello");
}

@end
