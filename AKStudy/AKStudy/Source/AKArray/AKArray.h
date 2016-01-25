//
//  AKArray.h
//  AKStudy
//
//  Created by Admin on 25.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKArray_h
#define AKArray_h

#include <stdio.h>

#include "AKObject.h"

static const uint8_t kAKArrayCount = 20;

typedef struct AKArray AKArray;

struct AKArray {
    AKObject _super;
    void * _array[kAKArrayCount];
};

extern
void __AKArrayDeallocate(AKArray *array);

extern
void *__AKArrayCreate();

extern
void AKArraySetData(void *array, char *data);

extern
char *AKArrayGetData(AKArray *string);


#endif /* AKArray_h */
