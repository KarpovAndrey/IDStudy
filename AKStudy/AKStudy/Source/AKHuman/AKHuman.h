//
//  AKHuman.h
//  AKStudy
//
//  Created by Admin on 08.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKHuman_h
#define AKHuman_h

#include <stdio.h>
#include <stdbool.h>

#include "AKString.h"

typedef enum {
    kAKUndefined,
    kAKManType = 1,
    kAKWomanType = 2,
} AKHumanGenderType;

typedef struct AKHuman AKHuman;

extern
AKHuman *AKHumanCreateWithNameAndGender(AKString *stringName, AKHumanGenderType gender);

extern
AKHuman *AKHumanCreateWithNameAndParents(AKString *stringName, AKHuman *father, AKHuman *mother);

extern
void AKHumanSetName(AKHuman *human, AKString *string);

extern
char *AKHumanGetName(AKHuman *human);

extern
void AKHumanSetAge(AKHuman *human, uint8_t age);
extern
uint8_t AKHumanGetAge(AKHuman *human);

extern
void AKHumanSetGender(AKHuman *human, AKHumanGenderType gender);
extern
AKHumanGenderType AKHumanGetGender(AKHuman *human);

extern
bool AKHumanGetIsMarried(AKHuman *human);

extern
AKHuman *AKHumanGetPartner(AKHuman *human);

extern
void AKHumanMarry(AKHuman *human, AKHuman *partner);

extern
void AKHumanDivorce(AKHuman *human);

extern
void AKHumanSetFather(AKHuman *child, AKHuman *father);

extern
AKHuman *AKHumanGetFather(AKHuman *child);

extern
void AKHumanSetMother(AKHuman *child, AKHuman *mother);

extern
AKHuman *AKHumanGetMother(AKHuman *child);

extern
void AKHumanRemoveChild(AKHuman *human, AKHuman *child);

extern
void AKHumanRemoveChildren(AKHuman *human);

#endif /* AKHuman_h */
