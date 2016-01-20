//
//  AKObject.c
//  AKStudy
//
//  Created by Admin on 20.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <stdlib.h>
#include <assert.h>

#include "AKObject.h"
#include "AKMacro.h"

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKObjectDeallocate(void *object) {
    free(object);
}

AKObject *__AKObjectCreate(size_t size) {
    AKObject *object = calloc(1, size);
    assert(object);
    object->_retainCount = 1;
    
    return object;
}

#pragma mark -
#pragma mark Public Implementation

void *AKObjectRetain(void *object) {
    AKReturnNullMacro(object);
    AKObject *newObject = object;
    newObject->_retainCount++;
    
    return newObject;
}

void AKObjectRelease(void *object) {
    AKReturnMacro(object);
    
    AKObject *newObject = object;
    
    newObject->_retainCount--;
    if (0 == newObject->_retainCount) {
        __AKObjectDeallocate(newObject);
    }
}