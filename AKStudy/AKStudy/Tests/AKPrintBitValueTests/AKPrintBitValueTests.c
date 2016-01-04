//
//  AKPrintBitValueTests.c
//  AKStudy
//
//  Created by Admin on 04.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKPrintBitValueTests.h"
#include "AKPrintBitValue.h"

static int32_t value1 = INT32_MAX;
static short value2 = 3242;
static char value3 = 4;
static int value4 = 5345;

void AKPrintBitValueOutputTest() {
    printf("Value 1 = %d\t", value1);
    AKPrintBitValueOutput(&value1, sizeof(value1));
    
    printf("\nValue 2 = %d\t", value2);
    AKPrintBitValueOutput(&value2, sizeof(value2));
    
    printf("\nValue 3 = %d\t", value3);
    AKPrintBitValueOutput(&value3, sizeof(value3));
    
    printf("\nValue 4 = %d\t", value4);
    AKPrintBitValueOutput(&value4, sizeof(value4));
}