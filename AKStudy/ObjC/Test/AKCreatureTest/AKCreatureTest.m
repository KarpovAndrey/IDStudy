//
//  AKCreatureTest.m
//  AKStudy
//
//  Created by Admin on 19.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKCreatureTest.h"
#import "AKCreature.h"
#import "AKCreatureMan.h"
#import "AKCreatureWoman.h"

@interface AKCreatureTest ()
@end

@implementation AKCreatureTest

+(void)creatureTest {
    //creating new creatures
    AKCreature *child1 = [[[AKCreature alloc] init] autorelease];
    AKCreature *child2 = [[[AKCreature alloc] init] autorelease];
    AKCreature *human = [[[AKCreature alloc] init] autorelease];
    AKCreature *human1 = [[[AKCreature alloc] init] autorelease];
    AKCreature *human2 = [[[AKCreature alloc] init] autorelease];
    AKCreature *human3 = [[[AKCreature alloc] init] autorelease];

    [human name:@"Alex"];
    
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
    AKCreatureMan *man1 = [[[AKCreatureMan alloc] init] autorelease];
    AKCreatureMan *man2 = [[[AKCreatureMan alloc] init] autorelease];

    AKCreatureWoman *woman1 = [[[AKCreatureWoman alloc] init] autorelease];
    AKCreatureWoman *woman2 = [[[AKCreatureWoman alloc] init] autorelease];
    AKCreatureMan *new = [AKCreatureMan objectCreate];

//    
//    [man1 performGenderSpecificOperation];
//    [man2 performGenderSpecificOperation];
//    [woman1 performGenderSpecificOperation];
//    [woman2 performGenderSpecificOperation];

    NSArray *array = @[man1, man2, woman1, woman2];
    
    for (NSUInteger i = 0; i < [array count]; i++) {
        [array[i] performGenderSpecificOperation];
    }

}

@end

