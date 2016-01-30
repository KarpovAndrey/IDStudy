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
#include <stdbool.h>

#include "AKObject.h"

static const uint8_t kAKArrayCount = 20;

extern const uint8_t kAKUndefindedIndex;

typedef struct AKArray AKArray;

struct AKArray {
    AKObject _super;
    void *_array[kAKArrayCount];
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
void *AKArrayGetObjectAtIndex(AKArray *array, uint8_t index);

extern
uint8_t AKArrayGetCount(AKArray *array);

extern
void AKArrayRemoveObject(AKArray *array, void *object);

extern
void AKArrayRemoveAllObjects(AKArray *array);

extern
bool AKArrayIsContain(AKArray *array, void *object);

#endif /* AKArray_h */
