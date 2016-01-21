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

void *__AKObjectCreate(size_t size, AKObjectDeallocator *_deallocator) {
    AKObject *object = calloc(1, size);
    assert(object);
    object->_retainCount = 1;
    object->_deallocator = _deallocator;
    
    return object;
}

#pragma mark -
#pragma mark Public Implementation

void *AKObjectRetain(void *object) {
    AKReturnNullMacro(object);
    AKObject *newObject = object;
    newObject->_retainCount++;
    assert(UINT64_MAX > newObject->_retainCount);
    
    return newObject;
}

void AKObjectRelease(void *object) {
    AKReturnMacro(object);
    
    AKObject *newObject = object;
    
    newObject->_retainCount--;
    if (0 == newObject->_retainCount) {
        newObject->_deallocator(object);
    }
}

