//
//  AKHumanTest.c
//  AKStudy
//
//  Created by Admin on 09.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <stdlib.h>
#include "AKHumanTest.h"
#include "AKHuman.h"
#include "AKObject.h"
#include "AKString.h"

void AKHumanTest() {
    
//    AKHuman *humanSergey= AKHumanCreate();
//    AKHumanSetName(humanSergey, "Sergey");
//    printf("Name = '%s'\n", AKHumanGetName(humanSergey));
//
//    AKHumanSetAge(humanSergey, 35);
//    printf("Age = %d years\n", AKHumanGetAge(humanSergey));
//    
//    AKHumanSetSex(humanSergey, kAKManType);
//    printf("Sex = %s\n", (AKHumanGetSex(humanSergey) == 1) ? "man" : "woman");
//    
////    AKHumanSetMarried(humanSergey, false);
////    printf("%s is ", AKHumanGetSex(humanSergey) ? "He" : "She");
////    printf("%s", AKHumanGetMarried(humanSergey) ? "is not married" : "married");
//    
//    AKHumanSetQuantityChildren(humanSergey, kAKManType);
//    printf("%s has ", AKHumanGetSex(humanSergey) == kAKManType ? "He" : "She");
//    printf("%d %s\n", AKHumanGetQuantityChildren(humanSergey),
//           AKHumanGetQuantityChildren(humanSergey) > 1 ? "children" : "child");
//        
//    printf("\n");
//    
//    AKHuman *humanSveta= AKHumanCreate();
//    AKHumanSetName(humanSveta, "Sveta");
//    printf("Name = '%s'\n", AKHumanGetName(humanSveta));
//    
//    AKHumanSetAge(humanSveta, 27);
//    printf("Age = %d years\n", AKHumanGetAge(humanSveta));
//    
//    AKHumanSetSex(humanSveta, kAKWomanType);
//    printf("Sex = %s\n", AKHumanGetSex(humanSveta) == kAKManType ? "man" : "woman");
//    
////    AKHumanSetMarried(humanSveta, 1);
////    printf("%s is ", AKHumanGetSex(humanSveta) == kAKManType ? "He" : "She");
////    printf("%s\n", AKHumanGetMarried(humanSveta) ? "married" : "not married");
//    
//    AKHumanSetQuantityChildren(humanSveta, 3);
//    printf("%s has ", AKHumanGetSex(humanSveta) == kAKManType ? "He" : "She");
//    printf("%d %s\n", AKHumanGetQuantityChildren(humanSveta),
//           AKHumanGetQuantityChildren(humanSveta) > 1 ? "children" : "child");
//    
//    AKHumanMarry(humanSergey, humanSveta);
//    printf("\n%s is %s\n", AKHumanGetName(humanSergey),
//           AKHumanGetMarried(humanSergey) ? "married" : "not married");
//    
//    AKHumanDivorce(humanSergey, humanSveta);
//    printf("%s is %s\n", AKHumanGetName(humanSveta),
//           AKHumanGetMarried(humanSveta) ? "married" : "not married");
//        
//    AKHumanDeallocate(humanSergey);
//    humanSergey = NULL;
//    AKHumanDeallocate(humanSveta);
//    humanSveta = NULL;
    
//    AKString *sergey = AKStringCreateWithData("Sergey");
//    puts(AKStringGetData(sergey));
//    
//    AKString *namePapa = __AKStringCreate();
//    AKStringSetData(namePapa, "Tom");
//    printf("%d\n", AKStringGetStringLong(namePapa));
//    
//    AKString *nameMama = __AKStringCreate();
//    AKStringSetData(nameMama, "Sara");
//    printf("%d\n", AKStringGetStringLong(nameMama));
//    
//    printf("%d\n", AKStringIsEqual(namePapa, nameMama));
//    
//    puts(AKStringGetData(AKStringWithString(namePapa, nameMama)));
//    
    
    
//    printf("%d\n", AKStringGetStringLong(namePapa));
    
//    AKObjectRelease(namePapa);
//    AKObjectRelease(papa);

////    AKObjectRelease(papa);
//    AKHumanMarry(papa, mama);
//    AKHuman *child1 = AKHumanCreateWithNameAndParents("Kinder1", papa, mama);
//    printf("%s\n", AKHumanGetName(child1));
//    
//    AKHuman *child2 = AKHumanCreateWithNameAndParents("Kinder2", papa, mama);
//    printf("%s\n", AKHumanGetName(child2));
//    
//    AKHuman *child3 = AKHumanCreateWithNameAndParents("Kinder3", papa, mama);
//    printf("%s\n", AKHumanGetName(child3));
//    
////    AKHumanRemoveChild(papa, child1);
////    AKHumanRemoveChild(mama, child1);
//    
////    AKHumanMarry(child1, child2);
////    AKHumanDivorce(child1);
////    AKHumanRemoveChildren(papa);
////    AKHumanRelease(child1);
//    AKHumanRemoveChildren(papa);
//    printf("%s\n", AKHumanGetName(child3));
//    AKHumanDivorce(papa);
    AKHuman *man = AKHumanCreateWithNameAndGender(AKStringCreateWithData("Man"), kAKManGender);
    AKHuman *woman = AKHumanCreateWithNameAndGender(AKStringCreateWithData("Woman"), kAKWomanGender);
    AKHuman *child = AKHumanCreateWithNameAndParents(AKStringCreateWithData("Child"), man, woman);

    
 }