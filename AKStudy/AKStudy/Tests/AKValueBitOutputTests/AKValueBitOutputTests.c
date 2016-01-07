//
//  AKValueBitOutputTests.c
//  AKStudy
//
//  Created by Admin on 05.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKValueBitOutputTests.h"
#include "AKValueBitOutput.h"

static short value1 = UINT8_MAX;
static double value2 = 3242;
static char value3 = 4;
static int value4 = 5345;

void AKPrintingByteValuesTest() {
    printf("short value1 = %d\t", value1);
    AKPrintingByteValues(&value1, sizeof(value1));
    
    printf("\n\ndouble value2 = %f\t", value2);
    AKPrintingByteValues(&value2, sizeof(value2));
    
    printf("\n\nchar value3 = %d\t", value3);
    AKPrintingByteValues(&value3, sizeof(value3));
    
    printf("\n\nint value4 = %d\t", value4);
    AKPrintingByteValues(&value4, sizeof(value4));
}