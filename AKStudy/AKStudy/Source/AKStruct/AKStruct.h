//
//  AKStruct.h
//  AKStudy
//
//  Created by Admin on 29.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#ifndef AKStruct_h
#define AKStruct_h

#include <stdio.h>
#include <stdbool.h>

typedef struct {
    double weight; //8
    
    long long wealth; //8
    
    char *surname; //8
    
    int age; //4
    float growth; //4
    
    short workDays; //2
    short hospitalDays; //2
    short absenseFromWork; //2
    
    union {
        struct {
            bool haveMillion : 1;//1
            bool haveBusiness : 1;//1
            bool haveEliteCar : 1;//1
            bool haveFancyLady : 1;//1
            bool haveFancyMan : 1; //1
            bool haveHelicopter : 1;//1
        };
        char bitFields;
    };
} AKOfficials;

#endif /* AKStruct_h */
