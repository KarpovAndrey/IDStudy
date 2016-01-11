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

typedef enum {
    kAKUndefined,
    kAKManType = 1,
    kAKWomanType = 2,
} AKHumanSexType;

typedef struct AKHuman AKHuman;

extern
AKHuman *AKHumanCreate(void);

extern
void AKHumanDeallocate(AKHuman *human);

extern
void AKHumanSetName(AKHuman *human, char *name);
extern
char *AKHumanGetName(AKHuman *human);

extern
void AKHumanSetAge(AKHuman *human, uint8_t age);
extern
uint8_t AKHumanGetAge(AKHuman *human);

extern
void AKHumanSetSex(AKHuman *human, AKHumanSexType sex);
extern
AKHumanSexType AKHumanGetSex(AKHuman *human);

extern
void AKHumanSetQuantityChildren(AKHuman *human, uint8_t quantityChildren);
extern
uint8_t AKHumanGetQuantityChildren(AKHuman *human);

extern
void AKHumanSetMarried(AKHuman *human, bool married);
extern
bool AKHumanGetMarried(AKHuman *human);

extern
AKHuman *AKHumanGetPartner(AKHuman *human);

extern
void AKHumanMarry(AKHuman *human, AKHuman *partner);

extern
void AKHumanDivorce(AKHuman *human, AKHuman *partner);

#endif /* AKHuman_h */
