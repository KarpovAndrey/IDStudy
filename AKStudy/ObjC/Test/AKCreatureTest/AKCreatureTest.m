//
//  AKCreatureTest.m
//  AKStudy
//
//  Created by Admin on 19.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureTest.h"
#import "AKCreature.h"
#import "AKCreatureMale.h"
#import "AKCreatureFemale.h"

@interface AKCreatureTest ()
@end

@implementation AKCreatureTest

+(void)creatureTest {
    //creating new creatures
    AKCreature *child1 = [[[AKCreature alloc] initWithName:@"Child1"] autorelease];
    AKCreature *child2 = [[[AKCreature alloc] initWithName:@"Child2"] autorelease];
    AKCreature *human = [[[AKCreature alloc] initWithName:@"Human"] autorelease];
    
    //adding children to human's childrenArray
    [human addChild:child1];
    [human addChild:child2];
    
    //removing child2 from human's childrenArray
    [human removeChild:child2];
    
    //creating new creature with method giveBirthToChild
    //AKCreature *child3 = [human giveBirthToChild];
    
    //adding child1 to child3's childrenArray
    //[child3 addChild:child1];
    
    //saying "Hello" with method sayHello
    [human sayHello];
    
    NSLog(@"-------------------------------------------");
    
    
//    NSArray *array = @[human, human1, human2, human3];
//    
//    for (NSUInteger i = 0; i < [array count]; i++) {
//        if ([array[i] gender] == kAKManGender) {
//             [array[i] goToWar];
//        } else {
//            [array[i] giveBirthToChild];
//        }
//    }
    
    NSLog(@"TASK 2\n");
    AKCreatureMale *man1 = [AKCreatureMale creature];
    AKCreatureMale *man2 = [AKCreatureMale creature];
    AKCreatureFemale *woman1 = [AKCreatureFemale creature];
    AKCreatureFemale *woman2 = [AKCreatureFemale creature];
    
//    [man1 performGenderSpecificOperation];
//    [man2 performGenderSpecificOperation];
    [woman1 performGenderSpecificOperation];
//    [woman2 performGenderSpecificOperation];

    NSArray *creatures = @[man1, man2, woman1, woman2];
    
    for (AKCreature *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
    
    AKCreatureMale *male = [AKCreatureMale object];
}

@end

