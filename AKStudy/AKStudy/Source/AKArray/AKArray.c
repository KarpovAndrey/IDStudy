//
//  AKArray.c
//  AKStudy
//
//  Created by Admin on 25.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKArray.h"
#include "AKMacro.h"

#include <string.h>

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

static
void AKArraySetCount(AKArray *array, uint64_t count);

static
void AKArraySetCapacity(AKArray *array, uint64_t capacity);

static
uint64_t AKArrayGetCapacity(AKArray *array);

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
    AKArraySetCount(array, 0);
    AKArraySetCapacity(array, 0);
    
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
    AKRetainSetter(array->_arrayData[index], object);
}

void *AKArrayGetObjectAtIndex(AKArray *array, uint8_t index) {
    return array->_arrayData[index];
}


void AKArraySetCount(AKArray *array, uint64_t count) {
    AKAssignSetter(array->_count, count);
}

uint8_t AKArrayGetCount(AKArray *array) {
    AKReturnZeroMacro(array);
//    uint8_t count = AKArrayGetIndexObject(array, NULL);
    
    return array->_count;
//    (kAKUndefindedIndex == count) ? kAKArrayCount : count;
}

void AKArraySetData(AKArray *array, void **data) {
    AKAssignSetter(array->_arrayData, data);
}

void **AKArrayGetData(AKArray *array) {
    return array->_arrayData;
}

void AKArraySetCapacity(AKArray *array, uint64_t capacity) {
    AKAssignSetter(array->_capacity, capacity);
    size_t size = sizeof(void *);
    
    void **pointer = realloc(array->_arrayData, array->_count * size);
    AKArraySetData(array, pointer);
    
//    void *object = AKArrayGetObjectAtIndex(array, AKArrayGetCount(array));
//    memset(object, 0, (capacity - AKArrayGetCount(array)) * size);
}

uint64_t AKArrayGetCapacity(AKArray *array) {
    return array->_capacity;
}

#pragma mark -
#pragma mark Public Implementation

void AKArrayAddObject(AKArray *array, void *object) {
    AKReturnMacro(array);
//    if (AKArrayIsContain(array, object)) {
//        return;
//    }
    
    AKArraySetCapacity(array, (AKArrayGetCount(array) + 1));
    
    uint8_t index = AKArrayGetIndexObject(array, NULL);
//    if (index != kAKUndefindedIndex) {
        AKArraySetObjectAtIndex(array, object, index);
        AKArraySetCount(array, (array->_count + 1));
//    }
}

void AKArrayRemoveObject(AKArray *array, void *object) {
    uint8_t index = AKArrayGetIndexObject(array, object);
    if (index != kAKUndefindedIndex) {
        AKArrayRemoveObjectAtIndex(array, index);
    }
}

void AKArrayRemoveAllObjects(AKArray *array) {
    AKReturnMacro(array);
    for (uint8_t index = 0; index < AKArrayGetCount(array); index++) {
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
    for (; index < AKArrayGetCount(array)-1; index++) {
        void *firstValue = AKArrayGetObjectAtIndex(array, index);
        void *secondValue = AKArrayGetObjectAtIndex(array, index + 1);
        
        if ((firstValue == NULL) && (secondValue != NULL)) {
            AKArraySetObjectAtIndex(array, secondValue, index);
            AKArraySetObjectAtIndex(array, NULL, index + 1);
        }
    }
}

void AKArrayRemoveObjectAtIndex(AKArray *array, uint8_t index) {
    array->_arrayData = realloc(array->_arrayData, (AKArrayGetCount(array))*sizeof(void *));
    AKArraySetObjectAtIndex(array, NULL, index);
    AKArrayResort(array, index);
    
    AKArraySetCapacity(array, AKArrayGetCount(array));
}

uint8_t AKArrayGetIndexObject(AKArray *array, void *object) {
    for (uint8_t index = 0; index < AKArrayGetCount(array); index++) {
        if (AKArrayGetObjectAtIndex(array, index) == object) {
            return index;
        }
    }

    return kAKUndefindedIndex;
}

