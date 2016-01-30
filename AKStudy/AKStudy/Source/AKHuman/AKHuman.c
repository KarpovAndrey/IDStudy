//
//  AKHuman.c
//  AKStudy
//
//  Created by Admin on 08.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <stdlib.h>
#include <string.h>

#include "AKHuman.h"
#include "AKMacro.h"
#include "AKObject.h"
#include "AKString.h"
#include "AKArray.h"

struct AKHuman {
    AKObject _super;
    AKString *_name;
    AKHuman *_partner;
    AKHuman *_father;
    AKHuman *_mother;
    AKArray *_children;
    AKHumanGenderType _gender;
    uint8_t _age;
};

#pragma mark -
#pragma mark Private Declaration

static
void __AKHumanDeallocate(AKHuman *human);

static
void AKHumanSetPartner(AKHuman *human, AKHuman *partner);

static
void AKHumanAddChild(AKHuman *human, AKHuman *child);

static
void AKHumanSetChildren(AKHuman *human, AKArray *array);

static
void *AKHumanGetChildren(AKHuman *human);

static
void AKHumanSetParents(AKHuman *firstParent, AKHuman *secondParent, AKHuman *child);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKHumanDeallocate(AKHuman *human) {
    AKHumanSetName(human, NULL);
    AKHumanDivorce(human);
    AKHumanSetMother(human, NULL);
    AKHumanSetFather(human, NULL);
    AKHumanRemoveChildren(human);
    AKHumanSetChildren(human, NULL);
    __AKObjectDeallocate(human);
    
    puts("HUMAN KILLED");
}

AKHuman *AKHumanCreate(void) {
    AKHuman *human = AKObjectCreate(AKHuman);
    AKArray *array = AKArrayCreate();
    AKHumanSetChildren(human, array);
    AKObjectRelease(array);
    
    return human;
}

AKHuman *AKHumanCreateWithNameAndGender(AKString *stringName,  AKHumanGenderType gender) {
    AKHuman *humanWithName = AKHumanCreate();
    AKHumanSetName(humanWithName, stringName);
    AKHumanSetGender(humanWithName, gender);
    
    return humanWithName;
}

AKHuman *AKHumanCreateWithNameAndParents(AKString *stringName, AKHuman *firstParent, AKHuman *secondParent) {
    AKHuman *humanWithNameAndParents = AKHumanCreateWithNameAndGender(stringName, arc4random_uniform(2)+1);
    AKHumanSetParents(firstParent, secondParent, humanWithNameAndParents);
    AKHumanAddChild(firstParent, humanWithNameAndParents);
    AKHumanAddChild(secondParent, humanWithNameAndParents);
    
    return humanWithNameAndParents;
}

#pragma mark -
#pragma mark Accessors

void AKHumanSetChildren(AKHuman *human, AKArray *array) {
    AKReturnMacro(human);
    AKReturnMacro(array);
    AKRetainSetter(human->_children, array);
}

void *AKHumanGetChildren(AKHuman *human) {
    return human->_children;
}

void AKHumanSetName(AKHuman *human, AKString *stringName) {
    AKReturnMacro(human);
    
    AKRetainSetter(human->_name, stringName);
}

char *AKHumanGetName(AKHuman *human) {
    AKReturnNullMacro(human);
    return human->_name->_data;
}

void AKHumanSetAge(AKHuman *human, uint8_t age) {
    AKReturnMacro(human);
    AKAssignSetter(human->_age, age);
}

uint8_t AKHumanGetAge(AKHuman *human) {
    AKReturnZeroMacro(human);
    return human->_age;
}

void AKHumanSetGender(AKHuman *human, AKHumanGenderType gender) {
    AKReturnMacro(human);
    AKAssignSetter(human->_gender, gender);
    assert((gender = kAKManGender) || (gender != kAKWomanGender));
}

AKHumanGenderType AKHumanGetGender(AKHuman *human) {
    return human->_gender;
}

bool AKHumanGetIsMarried(AKHuman *human) {
    return AKHumanGetPartner(human) ? true : false;
}

void AKHumanSetPartner(AKHuman *human, AKHuman *partner) {
    AKReturnMacro(human);
    if (human->_partner == partner) {
        return;
    }

    AKHumanGenderType type = AKHumanGetGender(human);
    
    if (kAKWomanGender == type) {
        AKAssignSetter(human->_partner, partner);
    } else {
        AKRetainSetter(human->_partner, partner);
    }
}

AKHuman *AKHumanGetPartner(AKHuman *human) {
    return human->_partner;
}

void AKHumanSetFather(AKHuman *human, AKHuman *father) {
    AKReturnMacro(human);
    AKAssignSetter(human->_father, father);
}

AKHuman *AKHumanGetFather(AKHuman *human) {
    return human->_father;
}

void AKHumanSetMother(AKHuman *human, AKHuman *mother) {
    AKReturnMacro(human);
    AKAssignSetter(human->_mother, mother);
}

AKHuman *AKHumanGetMother(AKHuman *human) {
    return human->_mother;
}

#pragma mark -
#pragma mark Public Implementation

void AKHumanMarry(AKHuman *human, AKHuman *partner) {
    AKReturnMacro(human);
    AKReturnMacro(partner);
    
    if ((human->_super._retainCount == 0) || (partner->_super._retainCount == 0)) {
        printf("RETAIN ERROR\n");
        return;
    }
    
    if (AKHumanGetGender(human) == AKHumanGetGender(partner)) {
        printf("I am opposed to gay marriage\n");
    } else {
        AKHumanSetPartner(human, partner);
        AKHumanSetPartner(partner, human);
    }
}

void AKHumanDivorce(AKHuman *human) {
    AKReturnMacro(human);
    AKHumanSetPartner(AKHumanGetPartner(human), NULL);
    AKHumanSetPartner(human, NULL);
}

void AKHumanRemoveChild(AKHuman *human, AKHuman *child) {
    AKReturnMacro(human);
    AKReturnMacro(child);
    
    AKArrayRemoveObject(AKHumanGetChildren(human), child);
    
    AKHumanGetGender(human) == kAKManGender
    ? AKHumanSetFather(child, NULL)
    : AKHumanSetMother(child, NULL);
}

void AKHumanRemoveChildren(AKHuman *human) {
    AKReturnMacro(human);
    for (uint8_t index = 0; index < AKArrayGetCount(AKHumanGetChildren(human)); index++) {
        AKHumanRemoveChild(human, AKHumanGetChildren(human));
    }
}

#pragma mark -
#pragma mark Private Implementation

void AKHumanAddChild(AKHuman *human, AKHuman *child) {
    AKReturnMacro(human);
    AKReturnMacro(child);
    AKArrayAddObject(human->_children, child);
}

void AKHumanSetParents(AKHuman *firstParent, AKHuman *secondParent, AKHuman *child) {
    assert(AKHumanGetGender(firstParent) != AKHumanGetGender(secondParent));
    if (AKHumanGetGender(firstParent) == kAKManGender &&
        AKHumanGetGender(secondParent) == kAKWomanGender) {
        AKHumanSetFather(child, firstParent);
        AKHumanSetMother(child, secondParent);
    } else {
        AKHumanSetMother(child, firstParent);
        AKHumanSetFather(child, secondParent);
    }
    
}
