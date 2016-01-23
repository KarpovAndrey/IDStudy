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
}

char *AKStringGetData(AKString *string) {
    AKReturnNullMacro(string);
    return string->_data;
}

#pragma mark -
#pragma mark Public

//void AKStringLong(void *string) {
//    printf("The string has %lu symbols\n", strlen(AKStringGetData(string)));
//}
