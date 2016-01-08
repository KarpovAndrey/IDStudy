//
//  AKHuman.c
//  AKStudy
//
//  Created by Admin on 08.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <stdlib.h>

#include "AKHuman.h"

struct AKHuman {
    AKHumans *partner;
    AKHumans *parents;
    AKHumans *children[20];
    char *_name;
    int _age;
    bool _sex;
    uint8_t _quantityChildren;
    bool _married;
};

#pragma mark -
#pragma mark Initializations and Deallocations

AKHumans *AKHumansCreate(void) {
    AKHumans *human = calloc(1, sizeof(AKHumans));
    
    return human;
}

void AKHumanDeallocate(AKHumans *human) {
    free(human);
}

#pragma mark - 
#pragma mark Accessors

void AKHumanSetName(AKHumans *human, char *name) {
    human -> _name = name;
}

char *AKHumanGetName(AKHumans *human) {
    return human -> _name;
}

void AKHumanSetAge(AKHumans *human, int age) {
    human -> _age = age;
}

int *AKHumanGetAge(AKHumans *human) {
    return human -> _age;
}

void AKHumanSetSex(AKHumans *human, bool *sex) {
    human -> _sex = *sex;
}

bool AKHumanGetSex(AKHumans *human) {
    return human -> _sex;
}

void AKHumanSetQuantityChildren(AKHumans *human, uint8_t *quantityChildren) {
    human -> _quantityChildren = *quantityChildren;
}

uint8_t AKHumanGetQuantityChildren(AKHumans *human) {
    return human -> _quantityChildren;
}

void AKHumanSetMarried(AKHumans *human, bool *married) {
    human -> _married = *married;
}

bool AKHumanGetMarried(AKHumans *human) {
    return human -> _married;
}

//Создать объектную структуру данных человек, имеющую поля имя, возраст, пол, количество детей, женат или нет, указатель на партнера, на родителей и на массив с детьми, где могло бы быть, максимум, 20 детей.

