//
//  AKCreatureFemale.m
//  AKStudy
//
//  Created by Admin on 21.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureFemale.h"

@interface AKCreatureFemale ()

- (AKCreature *)giveBirthToChild;

@end

@implementation AKCreatureFemale

#pragma mark -
#pragma mark Public

- (AKCreature *)giveBirthToChild {
    NSLog(@"I am a woman OOOOOooo I'm giving birth");
    
    return [AKCreature object];
}

- (void)performGenderSpecificOperation {
        [self giveBirthToChild];
}

@end
