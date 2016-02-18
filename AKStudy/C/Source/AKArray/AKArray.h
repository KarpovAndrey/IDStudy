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
#include <stdlib.h>
#include <stdbool.h>

#include "AKObject.h"

extern const uint64_t kAKUndefindedIndex;

typedef struct AKArray AKArray;

struct AKArray {
    AKObject _super;
    void **_arrayData;
    uint64_t _count;
    uint64_t _capacity;
};

extern
void __AKArrayDeallocate(AKArray *array);

extern
void *AKArrayCreate();

extern
void *AKArrayCreateWithObject(AKArray *array, void *object);

extern
void AKArrayAddObject(AKArray *array, void *object);

extern
void *AKArrayGetObjectAtIndex(AKArray *array, uint64_t index);

extern
uint64_t AKArrayGetCount(AKArray *array);

extern
void AKArrayRemoveObject(AKArray *array, void *object);

extern
void AKArrayRemoveAllObjects(AKArray *array);

extern
bool AKArrayContainsObject(AKArray *array, void *object);

extern
void AKArraySetData(AKArray *array, void **data);

extern
void **AKArrayGetData(AKArray *array);

extern
void *AKGetFirstElement(AKArray *array);

extern
void *AKGetLastElement(AKArray *array);

#endif /* AKArray_h */
