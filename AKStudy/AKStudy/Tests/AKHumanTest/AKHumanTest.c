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
    AKHumans *humanSergey= AKHumansCreate();
    AKHumanSetName(humanSergey, "Sergey");
    printf("Name = '%s'\n", AKHumanGetName(humanSergey));
    
    AKHumanSetAge(humanSergey, 35);
    printf("Age = %d years\n", AKHumanGetAge(humanSergey));
    
    AKHumanSetSex(humanSergey, true);
    printf("Sex = %s\n", AKHumanGetSex(humanSergey)? "Man" : "Woman");
    
    AKHumanSetMarried(humanSergey, true);
    printf("%s is ", AKHumanGetSex(humanSergey) ? "He" : "She");
    printf("%s\n", AKHumanGetMarried(humanSergey) ? "married" : "not married");
    
    AKHumanSetQuantityChildren(humanSergey, 0);
    printf("%s has ", AKHumanGetSex(humanSergey) ? "He" : "She");
    printf("%d %s\n", AKHumanGetQuantityChildren(humanSergey),
           (AKHumanGetQuantityChildren(humanSergey) > 1) ? "children" : "child");
    
    AKHumanDeallocate(humanSergey);
    humanSergey = NULL;
    
    printf("\n");
    
    AKHumans *humanSveta= AKHumansCreate();
    AKHumanSetName(humanSveta, "Sveta");
    printf("Name = '%s'\n", AKHumanGetName(humanSveta));
    
    AKHumanSetAge(humanSveta, 27);
    printf("Age = %d years\n", AKHumanGetAge(humanSveta));
    
    AKHumanSetSex(humanSveta, false);
    printf("Sex = %s\n", AKHumanGetSex(humanSveta)? "Man" : "Woman");
    
    AKHumanSetMarried(humanSveta, false);
    printf("%s is ", AKHumanGetSex(humanSveta) ? "He" : "She");
    printf("%s\n", AKHumanGetMarried(humanSveta) ? "married" : "not married");
    
    AKHumanSetQuantityChildren(humanSveta, 1);
    printf("%s has ", AKHumanGetSex(humanSveta) ? "He" : "She");
    printf("%d %s\n", AKHumanGetQuantityChildren(humanSveta),
           (AKHumanGetQuantityChildren(humanSveta) > 1) ? "children" : "child");
    
    AKHumanDeallocate(humanSveta);
    humanSveta = NULL;
}