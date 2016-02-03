//
//  AKArrayTest.c
//  AKStudy
//
//  Created by Admin on 27.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKArrayTest.h"
#include "AKString.h"
#include "AKObject.h"
#include "AKHuman.h"
#include "AKArray.h"

void AKArrayTest() {
//    
//    AKString *nameVasia = AKStringCreateWithData("Vasia");
//    AKHuman *humanVasia = AKHumanCreateWithNameAndGender(nameVasia, kAKManType);
//    
//    AKString *nameLinda = AKStringCreateWithData("Linda");
//    AKHuman *humanLinda = AKHumanCreateWithNameAndGender(nameLinda, kAKWomanType);
//    
//    AKString *nameKinder1 = AKStringCreateWithData("Kinder1");
//    AKHuman *humanKinder1 = AKHumanCreateWithNameAndParents(nameKinder1, humanVasia, humanLinda);
//    
//    AKString *nameKinder2 = AKStringCreateWithData("Kinder2");
//    AKHuman *humanKinder2 = AKHumanCreateWithNameAndParents(nameKinder2, humanVasia, humanLinda);
//    
//    AKArray *children = __AKArrayCreate();
//    AKArraySetObject(children, nameKinder1);
//    AKArraySetObject(children, nameKinder2);
//    AKHumanRemoveChild(humanVasia, humanKinder1);
//    AKHumanRemoveChild(humanLinda, humanKinder2);
    
    AKArray *arrayChildren = AKArrayCreate();
    
    AKString *string1 = AKStringCreateWithData("Child 1");
    AKString *string2 = AKStringCreateWithData("Child 2");
    AKString *string3 = AKStringCreateWithData("Child 3");

    for (int index = 0; index < 1000; index++) {
        AKArrayAddObject(arrayChildren, string1);
        AKArrayAddObject(arrayChildren, string2);
        AKArrayAddObject(arrayChildren, string3);
    }
    
    printf("%d\n", AKArrayIsContain(arrayChildren, string1));
    AKArrayRemoveObject(arrayChildren, string2);
//    
//    printf("%d\n", AKArrayGetCount(arrayChildren));
//    
//    AKArrayRemoveObject(arrayChildren, string1);
//    printf("%d\n", AKArrayIsContain(arrayChildren, string1));
//    printf("%d\n", AKArrayGetCount(arrayChildren));

}