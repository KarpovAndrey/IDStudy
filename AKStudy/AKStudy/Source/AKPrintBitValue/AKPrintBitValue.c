//
//  AKPrintBitValue.c
//  AKStudy
//
//  Created by Admin on 04.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKPrintBitValue.h"
#include <stdbool.h>

#pragma mark -
#pragma mark Private Declarations

uint8_t kAKCounter = 8;

static
void AKPrintBitValue(char * byteAdress);

struct {
    union {
        bool boolValue : 1;
    };
    char charValue;
} TestEndian;

charValue = 1;

#pragma mark -
#pragma mark Private Implementations

void AKPrintBitValue(char * byteAdress) {
    
    
    
    int8_t value = * byteAdress;
    
    for (int8_t shiftedBitCount = kAKCounter; shiftedBitCount > 0; shiftedBitCount--) {
        uint8_t shiftedValue = value >> (shiftedBitCount - 1);
        
        printf((shiftedValue & 1) ? "1" : "0");
    }
}

#pragma mark -
#pragma mark Public Implementations

void AKPrintBitValueOutput(void * byteAdress, size_t size) {
    char *bitFieldAdress = (char *) byteAdress;
    
    for (uint16_t index = 0; index < size; index++) {
        char byte = bitFieldAdress[size - index - 1];
        
        AKPrintBitValue(&byte);
        
        printf(" ");
    }
}

