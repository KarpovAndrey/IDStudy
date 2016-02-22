//
//  AKCreatureFemale.m
//  AKStudy
//
//  Created by Admin on 21.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureFemale.h"

@interface AKCreatureFemale ()
@property(nonatomic, assign) AKCreatureGender gender;

#pragma mark -
#pragma mark Private Declarations

- (AKCreatureFemale *)giveBirthToChild;

@end

@implementation AKCreatureFemale

#pragma mark -
#pragma mark Private

- (instancetype)init {
    self = [super init];
    if (self) {
        self.gender = kAKWomanGender;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (AKCreature *)giveBirthToChild {
    AKCreature *child = [[AKCreature new] autorelease];
    NSLog(@"I am a woman OOOOOooo I'm giving birth");
    
    return child;
}

- (void)performGenderSpecificOperation {
    if (self.gender == kAKWomanGender) {
        [self giveBirthToChild];
    }
}

@end
