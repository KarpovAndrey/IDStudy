//
//  AKHuman.c
//  AKStudy
//
//  Created by Admin on 08.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <stdlib.h>

#include "AKHuman.h"
#include "AKMacro.h"

struct AKHuman {
    AKHuman *_partner;
    AKHuman *_father;
    AKHuman *_mother;
    AKHuman *_children[20];
    char *_name;
    uint8_t _age;
    AKHumanSexType _sex;
    uint8_t _quantityChildren;
    bool _married;
};

#pragma mark -
#pragma mark Initializations and Deallocations

AKHuman *AKHumanCreate(void) {
    AKHuman *human = calloc(1, sizeof(AKHuman));
    AKCheckOnNull(human);
    return human;
}

void AKHumanDeallocate(AKHuman *human) {
    free(human);
}

#pragma mark -
#pragma mark Private Declaration

static
void AKHumanSetPartner(AKHuman *human, AKHuman *partner);

#pragma mark - 
#pragma mark Accessors

void AKHumanSetName(AKHuman *human, char *name) {
    AKCheckOnNull(human);
    human->_name = name;
}

char *AKHumanGetName(AKHuman *human) {
    AKCheckOnNull(human);
    return human->_name;
}

void AKHumanSetAge(AKHuman *human, uint8_t age) {
    AKCheckOnNull(human);
    human->_age = age;
}

uint8_t AKHumanGetAge(AKHuman *human) {
    AKCheckOnNull(human);
    return human->_age;
}

void AKHumanSetSex(AKHuman *human, AKHumanSexType sex) {
    if ((sex != kAKManType) && (sex != kAKWomanType)) {
        return assert(0);
    }
    AKCheckOnNull(human);
    human->_sex = sex;
}

AKHumanSexType AKHumanGetSex(AKHuman *human) {
    return human->_sex;
}

void AKHumanSetQuantityChildren(AKHuman *human, uint8_t quantityChildren) {
    AKCheckOnNull(human);
    human->_quantityChildren = quantityChildren;
}

uint8_t AKHumanGetQuantityChildren(AKHuman *human) {
    AKCheckOnNull(human);
    return human->_quantityChildren;
}

void AKHumanSetMarried(AKHuman *human, bool married) {
    AKCheckOnNull(human);
    human->_married = married;
}

bool AKHumanGetMarried(AKHuman *human) {
    AKCheckOnNull(human);
    return AKHumanGetPartner(human) ? true : false;
}

void AKHumanSetPartner(AKHuman *human, AKHuman *partner) {
    AKCheckOnNull(human);
    human->_partner = partner;
}

AKHuman *AKHumanGetPartner(AKHuman *human) {
    AKCheckOnNull(human);
    return human->_partner;
}

void AKHumanMarry(AKHuman *human, AKHuman *partner) {
    AKCheckOnNull(human);
    AKHumanSetPartner(human, partner);
    AKHumanSetPartner(partner, human);
}

void AKHumanDivorce(AKHuman *human, AKHuman *partner) {
    AKCheckOnNull(human);
    AKHumanSetPartner(AKHumanGetPartner(human), NULL);
    AKHumanSetPartner(human, NULL);
}


