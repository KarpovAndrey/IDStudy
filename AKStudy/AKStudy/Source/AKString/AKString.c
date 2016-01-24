//
//  AKString.c
//  AKStudy
//
//  Created by Admin on 22.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKString.h"
#include "AKMacro.h"
#include <string.h>
#include <stdlib.h>

#pragma mark -
#pragma mark Public Declarations

#pragma mark -
#pragma mark Initializations an Deallocations

void __AKStringDeallocate(AKString *string) {
    AKReturnMacro(string);
    AKStringSetData(string, NULL);
    AKStringSetStringLong(string, 0);
    __AKObjectDeallocate(string);
    printf("STRING KILLED\n");
}

void *__AKStringCreate() {
    AKString *string = AKObjectCreate(AKString);

    return string;
}

#pragma mark -
#pragma mark Accessors

void AKStringSetData(AKString *string, char *data) {
    AKReturnMacro(string);
    AKAssignSetter(string->_data , data);
    AKReturnMacro(data);
    AKStringSetStringLong(string, strlen(AKStringGetData(string)));
}

char *AKStringGetData(AKString *string) {
    AKReturnNullMacro(string);
    return string->_data;
}

void AKStringSetStringLong(AKString *string, uint8_t dataCount) {
    AKReturnMacro(string);
    AKAssignSetter(string->_dataCount, dataCount);
}

uint8_t AKStringGetStringLong(AKString *string) {
    return string->_dataCount;
}

void AKStringSetDataWithData(AKString *string, char *data) {
    AKReturnMacro(string);
    AKAssignSetter(string->_data, strcat(string->_data, data));
    
    AKReturnMacro(data);
    AKStringSetStringLong(string, strlen(AKStringGetData(string)));
}

char *AKStringGetDataWithData(AKString *string) {
    AKReturnNullMacro(string);
    return string->_data;
}

#pragma mark -
#pragma mark Public

//void AKStringLong(AKString *string) {
//    printf("The string has %d symbols\n", string->_dataCount);
//}
