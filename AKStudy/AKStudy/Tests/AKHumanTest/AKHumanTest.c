//
//  AKHumanTest.c
//  AKStudy
//
//  Created by Admin on 09.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKHumanTest.h"
#include "AKHuman.h"

void AKHumanTest(void) {
    AKHumans *human1= AKHumansCreate();
    AKHumanSetName(human1, "Sergey");
//    AKHumanSetAge(human1, 35);
    
    puts(AKHumanGetName(human1));
  //  puts(AKHumanGetAge(human1));
}