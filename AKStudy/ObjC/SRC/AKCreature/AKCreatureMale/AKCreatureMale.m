//
//  AKCreatureMale.m
//  AKStudy
//
//  Created by Admin on 21.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureMale.h"
#import "NSObject+AKCategoryObject.h"

@interface AKCreatureMale ()

#pragma mark -
#pragma mark Private Declarations

- (void)goToWar;

@end

@implementation AKCreatureMale

#pragma mark -
#pragma mark Public

- (void)goToWar {
    NSLog(@"I am a man, I going to war");
}

- (void)performGenderSpecificOperation {
        [self goToWar];
}

@end
