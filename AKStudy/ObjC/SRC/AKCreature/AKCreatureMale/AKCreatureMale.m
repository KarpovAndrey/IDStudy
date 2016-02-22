//
//  AKCreatureMale.m
//  AKStudy
//
//  Created by Admin on 21.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureMale.h"

@interface AKCreatureMale ()
@property(nonatomic, assign) AKCreatureGender gender;

#pragma mark -
#pragma mark Private Declarations

- (void)goToWar;

@end

@implementation AKCreatureMale

#pragma mark -
#pragma mark Private

- (instancetype)init {
    self = [super init];
    if (self) {
        self.gender = kAKManGender;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)goToWar {
    NSLog(@"I am a man, I going to war");
}

- (void)performGenderSpecificOperation {
    if (self.gender == kAKManGender) {
        [self goToWar];
    }
}

@end
