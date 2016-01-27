//
//  AKArray.c
//  AKStudy
//
//  Created by Admin on 25.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKArray.h"
#include "AKMacro.h"

#pragma mark -
#pragma mark Private Declarations

static
void AKArrayResort(AKArray *array, uint8_t index);

#pragma mark -
#pragma mark Initializations an Deallocations

void __AKArrayDeallocate(AKArray *array) {
    AKReturnMacro(array);
}

void *__AKArrayCreate() {
    AKArray *array = AKObjectCreate(AKArray);
    assert(array);
    
    return array;
}

#pragma mark - 
#pragma mark Accessors

void AKArraySetObject(AKArray *array, void *object) {
    //AKReturnMacro(array);
    uint8_t index = 0;
    while (AKArrayGetObjectAtIndex(array, index) != 0) {
        index++;
    }
    
    AKArraySetObjectAtIndex(array, object, index);
}

void AKArraySetObjectAtIndex(AKArray *array, void *object, uint8_t index) {
    AKReturnMacro(array);
    if (AKArrayGetCountFull(array) == kAKArrayCount) {
        printf("ARRAY IS FULL\n");
        return;
    }
    array->_array[index] = object;
}

void *AKArrayGetObjectAtIndex(AKArray *array, uint8_t index) {
    return array->_array[index];
}


uint8_t AKArrayGetCountFull(AKArray *array) {
    uint8_t count = 0;
    for (uint8_t index = 0; index < kAKArrayCount; index++) {
        if (AKArrayGetObjectAtIndex(array, index)) {
            count++;
        }
        array->_countFull = count;
    }
    
    return array->_countFull;
}

#pragma mark -
#pragma mark Public Implementation

void AKArrayRemoveObject(AKArray *array, void *object) {
    for (uint8_t index = 0; index < kAKArrayCount; index++) {
        while (array->_array[index] == object) {
            AKArrayRemoveObjectAtIndex(array, index);
            AKArrayResort(array, index);
        }
    }
}

void AKArrayRemoveAllObjects(AKArray *array) {
    AKReturnMacro(array);
    for (uint8_t index = 0; index < kAKArrayCount; index++) {
        AKArrayRemoveObjectAtIndex(array, index);
    }
}

#pragma mark -
#pragma mark Private Implementation

void AKArrayResort(AKArray *array, uint8_t index) {
    AKReturnMacro(array);
    for (uint8_t index = 0; index < kAKArrayCount; index++) {
        if ((array->_array[index] == NULL) && (array->_array[index+1] != NULL)) {
            array->_array[index] = array->_array[index + 1];
            array->_array[index + 1] = NULL;
        }
    }
}

void AKArrayRemoveObjectAtIndex(AKArray *array, uint8_t index) {
    AKArraySetObjectAtIndex(array, NULL, index);
}