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
#pragma mark Initializations an Deallocations

void __AKArrayDeallocate(AKArray *array) {
    AKReturnMacro(array);
}

void *__AKArrayCreate() {
    AKArray *array = AKObjectCreate(AKArray);
    
    return array;
}

#pragma mark - 
#pragma mark Accessors

void AKArraySetData(void *array, char *data);
    AKReturnMacro(array);
    uint8_t index = 0;
    while (&array[index] != 0) {
        index++;
    }
    
    array[index] = data;
}