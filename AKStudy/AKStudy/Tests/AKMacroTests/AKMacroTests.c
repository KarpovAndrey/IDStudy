//
//  AKMacroTests.c
//  AKStudy
//
//  Created by Admin on 29.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#include "AKMacroTests.h"
#include "AKMacro.h"

AKOutputType(int, %d);
AKOutputType(double, %.2f);
AKOutputType(char, %c);

void AKPrintSizeTypeTest() {
    printf("Print type's size\n");
    AKPrintTypeSize(int);
    AKPrintTypeSize(long);
    AKPrintTypeSize(char);
    AKPrintTypeSize(char *);
    AKPrintTypeSize(float);
    AKPrintTypeSize(double);
    printf("\n");
}

void AKPrintOutputValue() {
    printf("Print output values");
    AKOutputValue(%d, 15);
    AKOutputValue(%lu, 15651651655);
    AKOutputValue(%.2f, 143453.45);
    AKOutputValue(%s, "TEXT");
    printf("\n");
}

void AKPrintOutputTypeMacro() {
    printf("Print output type macro");
    AKOutputTypeMacro(int, 5);
    AKOutputTypeMacro(double, 3423.54);
    printf("\n");
}