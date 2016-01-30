//
//  AKArray.c
//  AKStudy
//
//  Created by Admin on 25.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKArray.h"
#include "AKMacro.h"

const uint8_t kAKUndefindedIndex = UINT8_MAX;

#pragma mark -
#pragma mark Private Declarations

static
void AKArrayResort(AKArray *array, uint8_t index);

static
void AKArraySetObjectAtIndex(AKArray *array, void *object, uint8_t index);

static
uint8_t AKArrayGetIndexObject(AKArray *array, void *object);

static
void AKArrayRemoveObjectAtIndex(AKArray *array, uint8_t index);

#pragma mark -
#pragma mark Initializations an Deallocations

void __AKArrayDeallocate(AKArray *array) {
    AKReturnMacro(array);
    AKArrayRemoveAllObjects(array);
    __AKObjectDeallocate(array);
}

void *AKArrayCreate() {
    AKArray *array = AKObjectCreate(AKArray);
    assert(array);
    
    return array;
}

void *AKArrayCreateWithObject(AKArray *array, void *object) {
    AKArray *arrayWithObject = AKArrayCreate();
    AKArrayAddObject(arrayWithObject, object);
    
    return arrayWithObject;
}

#pragma mark - 
#pragma mark Accessors

void AKArraySetObjectAtIndex(AKArray *array, void *object, uint8_t index) {
    AKReturnMacro(array);
    AKRetainSetter(array->_array[index], object);
}

void *AKArrayGetObjectAtIndex(AKArray *array, uint8_t index) {
    return array->_array[index];
}


uint8_t AKArrayGetCount(AKArray *array) {
    AKReturnZeroMacro(array);
    uint8_t count = AKArrayGetIndexObject(array, NULL);
    
    return (kAKUndefindedIndex == count) ? kAKArrayCount : count;
}

#pragma mark -
#pragma mark Public Implementation

void AKArrayAddObject(AKArray *array, void *object) {
    AKReturnMacro(array);
    AKReturnMacro(object);
    if (AKArrayIsContain(array, object)) {
        return;
    }
    
    uint8_t index = AKArrayGetIndexObject(array, NULL);
    if (index != kAKUndefindedIndex) {
        AKArraySetObjectAtIndex(array, object, index);
    }
}

void AKArrayRemoveObject(AKArray *array, void *object) {
    uint8_t index = AKArrayGetIndexObject(array, object);
    if (index != kAKUndefindedIndex) {
        AKArrayRemoveObjectAtIndex(array, index);
    }
}

void AKArrayRemoveAllObjects(AKArray *array) {
    AKReturnMacro(array);
    for (uint8_t index = 0; index < kAKArrayCount; index++) {
        AKArrayRemoveObjectAtIndex(array, index);
    }
}

bool AKArrayIsContain(AKArray *array, void *object) {
    uint8_t index = AKArrayGetIndexObject(array, object);
    
    return (AKArrayGetObjectAtIndex(array, index) ? true : false);
}

#pragma mark -
#pragma mark Private Implementation

void AKArrayResort(AKArray *array, uint8_t index) {
    AKReturnMacro(array);
    for (; index < kAKArrayCount-1; index++) {
        void *firstValue = AKArrayGetObjectAtIndex(array, index);
        void *secondValue = AKArrayGetObjectAtIndex(array, index + 1);
        
        if ((firstValue == NULL) && (secondValue != NULL)) {
            AKArraySetObjectAtIndex(array, secondValue, index);
            AKArraySetObjectAtIndex(array, NULL, index + 1);
        }
    }
}

void AKArrayRemoveObjectAtIndex(AKArray *array, uint8_t index) {
    AKArraySetObjectAtIndex(array, NULL, index);
    AKArrayResort(array, index);
}

uint8_t AKArrayGetIndexObject(AKArray *array, void *object) {
    for (uint8_t index = 0; index < kAKArrayCount; index++) {
        if (AKArrayGetObjectAtIndex(array, index) == object) {
            return index;
        }
    }

    return kAKUndefindedIndex;
}

