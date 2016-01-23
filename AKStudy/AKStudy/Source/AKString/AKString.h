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

#include "AKObject.h"

typedef struct AKString AKString;

struct AKString {
    AKObject _super;
    char *_data;
};

extern
void __AKStringDeallocate(AKString *string);

extern
void *__AKStringCreate();

extern
void AKStringSetData(AKString *string, char *data);

extern
char *AKStringGetData(AKString *string);

//extern
//void AKStringLong(void *string);

#endif /* AKString_h */
