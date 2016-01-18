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

static const uint8_t kAKChildrenCount = 20;

struct AKHuman {
    AKHuman *_partner;
    AKHuman *_father;
    AKHuman *_mother;
    AKHuman *_children[kAKChildrenCount];
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

static
AKHuman *AKHumanCreate(void);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKHumanDeallocate(AKHuman *human) {
    AKHumanSetPartner(human, NULL);
    AKHumanSetMother(human, NULL);
    AKHumanSetFather(human, NULL);
    free(human);
}

AKHuman *AKHumanCreate(void) {
    AKHuman *human = calloc(1, sizeof(AKHuman));
    human->_retainCount = 1;
    
    return human;
}

AKHuman *AKHumanCreateWithGenderNamed(char *name,  AKHumanGenderType gender) {
    AKHuman *humanWithName = AKHumanCreate();
    AKHumanSetName(humanWithName, name);
    AKHumanSetGender(humanWithName, gender);
    
    return humanWithName;
}

AKHuman *AKHumanCreateWithNameAndParents(char *name, AKHuman *father, AKHuman *mother) {
    AKHuman *humanWithNameAndParents = AKHumanCreate();
    AKHumanSetName(humanWithNameAndParents, name);
    AKHumanSetFather(humanWithNameAndParents, father);
    AKHumanSetMother(humanWithNameAndParents, mother);
    AKHumanAddChild(father, humanWithNameAndParents);
    AKHumanAddChild(mother, humanWithNameAndParents);
    AKHumanSetGender(humanWithNameAndParents, arc4random_uniform(2)+1);
    
    return humanWithNameAndParents;
}

#pragma mark -
#pragma mark Accessors

void AKHumanSetName(AKHuman *human, char *name) {
    AKReturnMacro(human);
    human->_name = name;
}

char *AKHumanGetName(AKHuman *human) {
    return human->_name;
}

void AKHumanSetAge(AKHuman *human, uint8_t age) {
    AKReturnMacro(human);
    human->_age = age;
}

uint8_t AKHumanGetAge(AKHuman *human) {
    return human->_age;
}

void AKHumanSetGender(AKHuman *human, AKHumanGenderType gender) {
    if ((gender != kAKManType) && (gender != kAKWomanType)) {
        return assert(0);
    }
    AKReturnMacro(human);
    human->_gender = gender;
}

AKHumanGenderType AKHumanGetGender(AKHuman *human) {
    return human->_gender;
}

bool AKHumanGetMarried(AKHuman *human) {
    return AKHumanGetPartner(human) ? true : false;
}

void AKHumanSetPartner(AKHuman *human, AKHuman *partner) {
    AKReturnMacro(human);
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
    AKReturnMacro(human);
    AKReturnMacro(partner);
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

void AKHumanSetFather(AKHuman *human, AKHuman *father) {
    human->_father = father;
}

AKHuman *AKHumanGetFather(AKHuman *human) {
    return human->_father;
}

void AKHumanSetMother(AKHuman *human, AKHuman *mother) {
    human->_mother = mother;
}

AKHuman *AKHumanGetMother(AKHuman *human) {
    return human->_mother;
}

void AKHumanAddChild(AKHuman *human, AKHuman *_children) {
    
    uint8_t index = 0;
    while (human->_children[index] != 0) {
        index++;
    }
    AKHumanRelease(human->_children[index]);
    human->_children[index] = _children;
    AKHumanRetain(human->_children[index]);
}

void AKHumanRemoveChild(AKHuman *human, AKHuman *child) {
    for (uint8_t index = 0; index < kAKChildrenCount; index++) {
        if (human->_children[index] == child) {
            AKHumanRelease(human->_children[index]);
            human->_children[index] = NULL;
            AKHumanGetGender(human) == kAKManType
            ? AKHumanSetFather(child, NULL)
            : AKHumanSetMother(child, NULL);
        }
    }
}

void AKHumanRetain(AKHuman *human) {
    AKReturnMacro(human);
    human->_retainCount++;
}

void AKHumanRelease(AKHuman *human) {
    AKReturnMacro(human);
    human->_retainCount--;
    if (0 ==human->_retainCount) {
        __AKHumanDeallocate(human);
    }
}

