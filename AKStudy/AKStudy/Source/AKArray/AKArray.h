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
    void ** _array[kAKArrayCount];
    uint8_t _countFull;
};

extern
void __AKArrayDeallocate(AKArray *array);

extern
void *__AKArrayCreate();

extern
void AKArraySetObject(AKArray *array, void *object);

extern
void AKArraySetObjectAtIndex(AKArray *array, void *object, uint8_t index);

extern
void *AKArrayGetObjectAtIndex(AKArray *array, uint8_t index);

extern
uint8_t AKArrayGetCountFull(AKArray *array);

extern
void AKArrayRemoveObjectAtIndex(AKArray *array, uint8_t index);

extern
void AKArrayRemoveObject(AKArray *array, void *object);

extern
void AKArrayRemoveAllObjects(AKArray *array);

#endif /* AKArray_h */
