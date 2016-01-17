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
    AKHumanGenderType _gender;
    char *_name;
    uint8_t _age;
    uint32_t _retainCount;
};

#pragma mark -
#pragma mark Private Declaration

static
void AKHumanSetPartner(AKHuman *human, AKHuman *partner);

static
void __AKHumanDeallocate(AKHuman *human);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKHumanDeallocate(AKHuman *human) {
    free(human);
}

AKHuman *AKHumanCreate(void) {
    AKHuman *human = calloc(1, sizeof(AKHuman));
    human->_retainCount = 1;
    
    return human;
}

AKHuman *AKHumanCreateWithName(char *name) {
    AKHuman *humanWithName = AKHumanCreate();
    AKHumanSetName(humanWithName, name);
    
    return humanWithName;
}

AKHuman *AKHumanCreateWithGenderNamed(char *name, AKHumanGenderType gender) {
    AKHuman *human = AKHumanCreateWithName(name);
    AKHumanSetGender(human, gender);
    
    return human;
}

AKHuman *AKChildCreate(void) {
    AKHuman *child = calloc(1, sizeof(AKHuman));
    child->_retainCount = 1;
    
    return child;
}

AKHuman *AKChildCreateWithNameAndParents(char *name, AKHuman *father, AKHuman *mother) {
    AKHuman *childWithNameAndParents = AKChildCreate();
    AKHumanSetName(childWithNameAndParents, name);
    AKHumanSetFather(childWithNameAndParents, father);
    AKHumanSetMother(childWithNameAndParents, mother);
    AKHumanSetChild(father, childWithNameAndParents);
    AKHumanSetChild(mother, childWithNameAndParents);
    
    return childWithNameAndParents;
}

#pragma mark -
#pragma mark Accessors

void AKHumanSetName(AKHuman *human, char *name) {
    AKCheckOnNull(human);
    human->_name = name;
}

char *AKHumanGetName(AKHuman *human) {
    return human->_name;
}

void AKHumanSetAge(AKHuman *human, uint8_t age) {
    AKCheckOnNull(human);
    human->_age = age;
}

uint8_t AKHumanGetAge(AKHuman *human) {
    return human->_age;
}

void AKHumanSetGender(AKHuman *human, AKHumanGenderType gender) {
    if ((gender != kAKManType) && (gender != kAKWomanType)) {
        return assert(0);
    }
    AKCheckOnNull(human);
    human->_gender = gender;
}

AKHumanGenderType AKHumanGetGender(AKHuman *human) {
    return human->_gender;
}

bool AKHumanGetMarried(AKHuman *human) {
    return AKHumanGetPartner(human) ? true : false;
}

void AKHumanSetPartner(AKHuman *human, AKHuman *partner) {
    AKCheckOnNull(human);
    if (human->_partner == partner) {
        return;
    }
    
    AKHumanGenderType type = AKHumanGetGender(human);
    
    if (kAKWomanType == type) {
        human->_partner = partner;
    } else {
        AKHumanRelease(human->_partner);
        human->_partner = partner;
        AKHumanRetain(human->_partner);
    }
}

AKHuman *AKHumanGetPartner(AKHuman *human) {
    return human->_partner;
}

#pragma mark -
#pragma mark Public Implementation

void AKHumanMarry(AKHuman *human, AKHuman *partner) {
    AKCheckOnNull(human);
    AKCheckOnNull(partner);
    if (AKHumanGetGender(human) == AKHumanGetGender(partner)) {
        return;
    }
    
    AKHumanSetPartner(human, partner);
    AKHumanSetPartner(partner, human);
}

void AKHumanDivorce(AKHuman *human) {
    AKCheckOnNull(human);
    AKHumanSetPartner(AKHumanGetPartner(human), NULL);
    AKHumanSetPartner(human, NULL);
}

void AKHumanSetFather(AKHuman *child, AKHuman *father) {
//   AKCheckOnNull(father);
    child->_father = father;
}

AKHuman *AKHumanGetFather(AKHuman *child) {
    return child->_father;
}

void AKHumanSetMother(AKHuman *child, AKHuman *mother) {
    AKCheckOnNull(mother);
    child->_mother = mother;
}

AKHuman *AKHumanGetMother(AKHuman *child) {
    return child->_mother;
}

void AKHumanSetChild(AKHuman *human, AKHuman *_children) {
//    AKCheckOnNull(_children);
    
    uint8_t index = 0;
    while (human->_children[index] != 0) {
        index++;
    }
        human->_children[index] = _children;
}

AKHuman *AKHumanGetChild(AKHuman *human) {
    return *human->_children;
}

void AKHumanChildDelete(AKHuman *child) {
    AKHumanSetChild(AKHumanGetFather(child), NULL);
    AKHumanSetChild(AKHumanGetMother(child), NULL);
}

void AKHumanRetain(AKHuman *human) {
    AKCheckOnNull(human);
    human->_retainCount++;
}

void AKHumanRelease(AKHuman *human) {
    AKCheckOnNull(human);
    human->_retainCount--;
    if (0 ==human->_retainCount) {
        __AKHumanDeallocate(human);
    }
}

