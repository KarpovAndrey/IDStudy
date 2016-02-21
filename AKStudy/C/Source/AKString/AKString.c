//
//  AKString.c
//  AKStudy
//
//  Created by Admin on 22.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <string.h>
#include <stdlib.h>

#include "AKString.h"
#include "AKMacro.h"

#pragma mark -
#pragma mark Initializations and Deallocations

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

void *AKStringCreateWithData(char *data) {
    AKString *string = __AKStringCreate();
    AKStringSetData(string, data);
    
    return string;
}

#pragma mark -
#pragma mark Accessors

void AKStringSetData(AKString *string, char *data) {
    AKReturnMacro(string);
    
    free(string->_data);
    
    if (data) {
        string->_data = strdup(data);
    } else {
        string->_data = NULL;
    }
}

char *AKStringGetData(AKString *string) {
    AKReturnNullMacro(string, NULL);
    return string->_data;
}

uint8_t AKStringGetStringCount(AKString *string) {
    AKReturnZeroMacro(string);
    AKAssignSetter(string->_dataCount, strlen(AKStringGetData(string)));
    
    return string->_dataCount;
}

#pragma mark -
#pragma mark Public

AKString *AKStringWithString(AKString *string, AKString *secondString) {
    AKReturnNullMacro(string, NULL);
    if (!secondString) {
        return string;
    }
    
    uint32_t count = AKStringGetStringCount(string) + AKStringGetStringCount(secondString);
    printf("%d\n", count);
    
    char *charString = calloc(count, sizeof(char));
    assert(charString);
    strcat(charString, AKStringGetData(string));
    strcat(charString, AKStringGetData(secondString));
    AKString *newString = AKStringCreateWithData(charString);
    
    return newString;
}

bool AKStringIsEqual(AKString *firstString, AKString *secondString) {
    AKReturnNullMacro(firstString, NULL);
    AKReturnNullMacro(secondString, NULL);
    
    return (strcmp(AKStringGetData(firstString), AKStringGetData(secondString)) == 0);
}

void AKStringPrintData(AKString *string) {
    puts(AKStringGetData(string));
}