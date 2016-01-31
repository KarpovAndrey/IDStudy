//
//  AKString.h
//  AKStudy
//
//  Created by Admin on 22.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKString_h
#define AKString_h

#include <stdio.h>
#include <stdbool.h>

#include "AKObject.h"

typedef struct AKString AKString;

struct AKString {
    AKObject _super;
    char *_data;
    uint8_t _dataCount;
};

extern
void __AKStringDeallocate(AKString *string);

extern
void *__AKStringCreate();

extern
void *AKStringCreateWithData(char *data);

extern
void AKStringSetData(AKString *string, char *data);

extern
char *AKStringGetData(AKString *string);

extern
uint8_t AKStringGetStringCount(AKString *string);

extern
AKString *AKStringWithString(AKString *string, AKString *secondString);

extern
bool AKStringIsEqual(AKString *firstString, AKString *secondString);

extern
void AKStringPrintData(AKString *string);

extern
void *__AKStringCreateNew(AKString *string);

#endif /* AKString_h */
