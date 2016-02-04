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

const uint64_t kAKUndefindedIndex = UINT64_MAX;

#pragma mark -
#pragma mark Private Declarations

static
void AKArrayResort(AKArray *array, uint64_t index);

static
void AKArraySetObjectAtIndex(AKArray *array, void *object, uint64_t index);

static
uint64_t AKArrayGetIndexObject(AKArray *array, void *object);

static
void AKArrayRemoveObjectAtIndex(AKArray *array, uint64_t index);

static
void AKArraySetCount(AKArray *array, uint64_t count);

static
void AKArraySetCapacity(AKArray *array, uint64_t capacity);

static
uint64_t AKArrayGetCapacity(AKArray *array);

static
bool AKArrayNeedToChangeSize(AKArray *array);

static
void AKRemoveObjectsInRange(AKArray *array, uint64_t firstIndex, uint64_t lastIndex);

static
uint64_t AKRecomendedSize(AKArray *array);

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

void AKArraySetObjectAtIndex(AKArray *array, void *object, uint64_t index) {
    AKReturnMacro(array);
    AKRetainSetter(array->_arrayData[index], object);
}

void *AKArrayGetObjectAtIndex(AKArray *array, uint64_t index) {
    AKReturnNullMacro(array, NULL);
    
    return array->_arrayData[index];
}


void AKArraySetCount(AKArray *array, uint64_t count) {
    AKReturnMacro(array);
    AKAssignSetter(array->_count, count);
}

uint64_t AKArrayGetCount(AKArray *array) {
    AKReturnNullMacro(array, 0);
    
    return array->_count;
}

void AKArraySetData(AKArray *array, void **data) {
    AKAssignSetter(array->_arrayData, data);
}

void **AKArrayGetData(AKArray *array) {
    AKReturnNullMacro(array, NULL);
    
    return array->_arrayData;
}

void AKArraySetCapacity(AKArray *array, uint64_t capacity) {
    AKReturnMacro(array);
//    if (array->_capacity == capacity) {
//        return;
//    }
    
    uint64_t count = AKArrayGetCount(array);
    size_t size = sizeof(void *);
    
    if (array->_capacity < capacity) {
        AKArraySetData(array, realloc(AKArrayGetData(array), capacity * size));
        memset(&array->_arrayData[count], 0, (capacity - count) * size);
    } else {
        AKRemoveObjectsInRange(array, capacity, count);
        AKArraySetData(array, realloc(AKArrayGetData(array), capacity * size));
    }
    
    AKAssignSetter(array->_capacity, capacity);
}

uint64_t AKArrayGetCapacity(AKArray *array) {
    AKReturnZeroMacro(array);
    
    return array->_capacity;
}

void *AKGetFirstElement(AKArray *array) {
    AKReturnNullMacro(array, NULL);
    
    return AKArrayGetObjectAtIndex(array, 0);
}

void *AKGetLastElement(AKArray *array) {
    AKReturnNullMacro(array, NULL);
    
    return AKArrayGetObjectAtIndex(array, (AKArrayGetCount(array) - 1));
}

#pragma mark -
#pragma mark Private Implementation

void AKArrayResort(AKArray *array, uint64_t index) {
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

void AKArrayRemoveObjectAtIndex(AKArray *array, uint64_t index) {
    AKReturnMacro(array);
    
    array->_arrayData = realloc(array->_arrayData, (AKArrayGetCount(array))*sizeof(void *));
    AKArraySetObjectAtIndex(array, NULL, index);
    AKArrayResort(array, index);
    AKArraySetCount(array, AKArrayGetCount(array) - 1);
    AKArraySetCapacity(array, AKArrayGetCapacity(array) - 1);
}

uint64_t AKArrayGetIndexObject(AKArray *array, void *object) {
    AKReturnNullMacro(array, 0);
    AKReturnNullMacro(object, 0);
    
    uint64_t indexObject = kAKUndefindedIndex;
    
    for (uint64_t index = 0; index < AKArrayGetCount(array); index++) {
        if (AKArrayGetObjectAtIndex(array, index) == object) {
            indexObject = index;
        }
    }
    
    return indexObject;
}

void AKArrayResizeIfNeeded(AKArray *array) {
    AKReturnMacro(array);
    
    if (AKArrayNeedToChangeSize(array)) {
        AKArraySetCapacity(array, AKRecomendedSize(array));
    }
}

bool AKArrayNeedToChangeSize(AKArray *array) {
    AKReturnNullMacro(array, false);
    
    uint64_t count = AKArrayGetCount(array);
    uint64_t capacity = AKArrayGetCapacity(array);
    
    if (capacity == count || (capacity - count) < (capacity * 0.2)) {
        return true;
    }
    
    return false;
}

uint64_t AKRecomendedSize(AKArray *array) {
    AKReturnNullMacro(array, 0);
    
    uint64_t count = AKArrayGetCount(array);
    uint64_t capacity = AKArrayGetCapacity(array);
    if (count == capacity) {
        capacity = (capacity + 5) * 1.2;
    } else {
        capacity = capacity * 0.9;
    }
    
    return capacity;
}


void AKRemoveObjectsInRange(AKArray *array, uint64_t firstIndex, uint64_t lastIndex) {
    AKReturnMacro(array);
    
    if (firstIndex > lastIndex) {
        return;
    }
    
    uint64_t count = AKArrayGetCount(array);
    for (uint64_t index = lastIndex; index > firstIndex; index --) {
        if (index < count) {
            AKArrayRemoveObjectAtIndex(array, index);
        }
    }
}

#pragma mark -
#pragma mark Public Implementation

void AKArrayAddObject(AKArray *array, void *object) {
    AKReturnMacro(array);
//    if (AKArrayContainObject(array, object)) {
//        return;
//    }
    
    AKArraySetCapacity(array, (AKArrayGetCount(array) + 1));
    AKArraySetObjectAtIndex(array, object, AKArrayGetCount(array));
    AKArraySetCount(array, (array->_count + 1));
    AKArrayResizeIfNeeded(array);
}

void AKArrayRemoveObject(AKArray *array, void *object) {
    AKReturnMacro(array);
    
    uint64_t index = AKArrayGetIndexObject(array, object);
    index != kAKUndefindedIndex ? AKArrayRemoveObjectAtIndex(array, index) : NULL;
}

void AKArrayRemoveAllObjects(AKArray *array) {
    AKReturnMacro(array);
    
    for (uint64_t index = AKArrayGetCount(array); index > 0; index--) {
        AKArrayRemoveObjectAtIndex(array, index);
    }
    
    AKArraySetCapacity(array, 0);
}

bool AKArrayContainObject(AKArray *array, void *object) {
    AKReturnNullMacro(array, false);
    
    uint64_t index = AKArrayGetIndexObject(array, object);
    
    return (AKArrayGetObjectAtIndex(array, index) ? true : false);
}
