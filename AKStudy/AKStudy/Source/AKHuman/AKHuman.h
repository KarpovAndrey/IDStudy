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

typedef struct AKHuman AKHumans;

extern
AKHumans *AKHumansCreate(void);

extern
void AKHumanDeallocate(AKHumans *human);

extern
void AKHumanSetName(AKHumans *human, char *name);
extern
char *AKHumanGetName(AKHumans *human);

extern
void AKHumanSetAge(AKHumans *human, int age);
extern
int *AKHumanGetAge(AKHumans *human);

extern
void AKHumanSetSex(AKHumans *human, bool *sex);
extern
bool AKHumanGetSex(AKHumans *human);

extern
void AKHumanSetQuantityChildren(AKHumans *human, uint8_t *quantityChildren);
extern
uint8_t AKHumanGetQuantityChildren(AKHumans *human);

extern
void AKHumanSetMarried(AKHumans *human, bool *married);
extern
bool AKHumanGetMarried(AKHumans *human);
#endif /* AKHuman_h */
