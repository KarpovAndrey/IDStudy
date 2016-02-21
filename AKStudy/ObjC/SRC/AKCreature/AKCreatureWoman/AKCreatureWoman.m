//
//  AKCreatureWoman.m
//  AKStudy
//
//  Created by Admin on 21.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureWoman.h"

@interface AKCreatureWoman ()
@property(nonatomic, assign) AKCreatureGender gender;

@end

@implementation AKCreatureWoman

#pragma mark -
#pragma mark Private

-(instancetype)init {
    self = [super init];
    if (self) {
        self.gender = kAKWomanGender;
    }
    return self;
}

#pragma mark -
#pragma mark Public

-(AKCreature *)giveBirthToChild {
    AKCreature *child = [[[AKCreature alloc] init] autorelease];
    NSLog(@"I am a woman OOOOOooo I'm giving birth");
    return child;
}

- (void)performGenderSpecificOperation {
    if (self.gender == kAKWomanGender) {
        [self giveBirthToChild];
    }
}

@end
