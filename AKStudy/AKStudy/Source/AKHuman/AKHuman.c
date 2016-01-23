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

static const uint8_t kAKChildrenCount = 20;

struct AKHuman {
    AKObject _super;
    AKString *_name;
    AKHuman *_partner;
    AKHuman *_father;
    AKHuman *_mother;
    AKHuman *_children[kAKChildrenCount];
    AKHumanGenderType _gender;
    uint8_t _age;
};

#pragma mark -
#pragma mark Private Declaration

static
void __AKHumanDeallocate(AKHuman *human);

static
AKHuman *AKHumanCreate(void);

static
void AKHumanSetPartner(AKHuman *human, AKHuman *partner);

static
void AKHumanAddChild(AKHuman *human, AKHuman *_children);

static
void AKHumanSetChildAtIndex(AKHuman *human, AKHuman *child, uint8_t index);

static
AKHuman *AKHumanGetChildAtIndex(AKHuman *human, uint8_t index);

static
void AKRemoveChildAtIndex(AKHuman *human, AKHuman *child, uint8_t index);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKHumanDeallocate(AKHuman *human) {
    AKHumanSetName(human, NULL);
    AKHumanDivorce(human);
    AKHumanSetMother(human, NULL);
    AKHumanSetFather(human, NULL);
    AKHumanRemoveChildren(human);
    __AKObjectDeallocate(human);
    
    puts("HUMAN KILLED");
}

AKHuman *AKHumanCreate(void) {
    AKHuman *human = AKObjectCreate(AKHuman);

    return human;
}

AKHuman *AKHumanCreateWithNameAndGender(AKString *stringName,  AKHumanGenderType gender) {
    AKHuman *humanWithName = AKHumanCreate();
    AKHumanSetName(humanWithName, (AKString *)stringName);
    AKHumanSetGender(humanWithName, gender);
    
    return humanWithName;
}

AKHuman *AKHumanCreateWithNameAndParents(AKString *stringName, AKHuman *father, AKHuman *mother) {
    AKHuman *humanWithNameAndParents = AKHumanCreateWithNameAndGender(stringName, arc4random_uniform(2)+1);
    AKHumanSetFather(humanWithNameAndParents, father);
    AKHumanSetMother(humanWithNameAndParents, mother);
    AKHumanAddChild(father, humanWithNameAndParents);
    AKHumanAddChild(mother, humanWithNameAndParents);
    
    return humanWithNameAndParents;
}

#pragma mark -
#pragma mark Accessors

//void AKHumanSetName(AKHuman *human, char *name) {
//    AKReturnMacro(human);
//    
//    if (human->_name != NULL) {
//        free(human->_name);
//    } if (!name) {
//        human->_name = NULL;
//    } else {
//        human->_name = strdup(name);
//    }
//}
//
//char *AKHumanGetName(AKHuman *human) {
//    return human->_name;
//}

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
    AKReturnNullMacro(human);
    return human->_age;
}

void AKHumanSetGender(AKHuman *human, AKHumanGenderType gender) {
    AKReturnMacro(human);
    AKAssignSetter(human->_gender, gender);
    if ((gender != kAKManType) && (gender != kAKWomanType)) {
        return assert(0);
    }
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
    
    if (kAKWomanType == type) {
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

void AKHumanSetChildAtIndex(AKHuman *human, AKHuman *child, uint8_t index) {
    AKRetainSetter(human->_children[index], child);
}

AKHuman *AKHumanGetChildAtIndex(AKHuman *human, uint8_t index) {
    return human->_children[index];
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
    for (uint8_t index = 0; index < kAKChildrenCount; index++) {
        AKRemoveChildAtIndex(human, child, index);
    }
}

void AKHumanRemoveChildren(AKHuman *human) {
    AKReturnMacro(human);
    for (uint8_t index = 0; index < kAKChildrenCount; index++) {
        AKRemoveChildAtIndex(human, AKHumanGetChildAtIndex(human, index), index);
    }
}

#pragma mark -
#pragma mark Private Implementation

void AKHumanAddChild(AKHuman *human, AKHuman *child) {
    AKReturnMacro(human);
    uint8_t index = 0;
    while (AKHumanGetChildAtIndex(human, index) != 0) {
        index++;
    }
    
    AKHumanSetChildAtIndex(human, child, index);
}

void AKRemoveChildAtIndex(AKHuman *human, AKHuman *child, uint8_t index) {
    if (AKHumanGetChildAtIndex(human, index) == child) {
        AKHumanSetChildAtIndex(human, NULL, index);
        
        AKHumanGetGender(human) == kAKManType
        ? AKHumanSetFather(child, NULL)
        : AKHumanSetMother(child, NULL);
    }
}
