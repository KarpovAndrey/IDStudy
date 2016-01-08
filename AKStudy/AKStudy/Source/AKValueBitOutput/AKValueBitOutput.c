//
//  AKValueBitOutput.c
//  AKStudy
//
//  Created by Admin on 05.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKValueBitOutput.h"

#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

typedef enum {
    kAKUndefined = 0,
    kAKLittleEndianType,
    kAKBigEndianType,
} AKEndianTypes;

typedef union {
    struct {
    bool boolValue1 : 1;
    bool boolValue2 : 1;
    bool boolValue3 : 1;
    bool boolValue4 : 1;
    bool boolValue5 : 1;
    bool boolValue6 : 1;
    bool boolValue7 : 1;
    bool boolValue8 : 1;
    };
    
    char charValue;
} AKTestEndianUnion;

static const uint8_t kAKCounter = 8;

#pragma mark -
#pragma mark Private Declarations

static
void AKPrintBitValue(char *byteAdress, AKEndianTypes type);

static
AKEndianTypes AKBitEndianType(void);

static
void AKPrintBitValueOutput(void *byteAdress, size_t size, AKEndianTypes type);

#pragma mark -
#pragma mark Private Implementations

AKEndianTypes AKBitEndianType() {
    AKTestEndianUnion testEndianUnion;
    testEndianUnion.charValue = 1;
    uint8_t typeEndian = kAKUndefined;
    if (testEndianUnion.boolValue1 == 1) {
        typeEndian = kAKLittleEndianType;
    } else if (testEndianUnion.boolValue8 == 1) {
        typeEndian = kAKBigEndianType;
    }
    
    return typeEndian;
}

void AKPrintBitValue(char *byte, AKEndianTypes type) {
    int8_t value = *byte;
    for (int8_t shiftedBitCount = kAKCounter; shiftedBitCount > 0; shiftedBitCount--) {
        uint8_t index = (kAKLittleEndianType == type)
                    ? (shiftedBitCount)
                    : (kAKCounter - shiftedBitCount + 1);
        printf((value >> (index - 1) & 1) ? "1" : "0");
    }
}

#pragma mark -
#pragma mark Public Implementations

void AKPrintBitValueOutput(void *byte, size_t size, AKEndianTypes type) {
    type = AKBitEndianType();
    if (type == kAKUndefined) {
        printf("\nATTENTION!! This is unknown endian-type");
        assert(0);
    }
    char *bitFieldAdress = (char *)byte;
    for (uint16_t count = 0; count < size; count++) {
        uint8_t index = (kAKBigEndianType == type) ? count : size - count - 1;
        char byte = bitFieldAdress[index];
        AKPrintBitValue(&byte, type);
        printf(" ");
    }
}

void AKPrintingByteValues(void *byte, size_t size) {
    AKPrintBitValueOutput(byte, size, AKBitEndianType());
}
