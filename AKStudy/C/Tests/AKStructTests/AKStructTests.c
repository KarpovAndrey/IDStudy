//
//  AKStructTest.c
//  AKStudy
//
//  Created by Admin on 29.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#include "AKStructTests.h"
#include "AKStruct.h"

#include <stddef.h>

void AKPrintStructOffsetofTest() {
    printf("STPUCT\n");
    printf("Offset from the beginning %lu\n", offsetof(AKOfficials, surname));
    printf("Offset from the beginning %lu\n", offsetof(AKOfficials, age));
    printf("Offset from the beginning %lu\n", offsetof(AKOfficials, growth));
}

void AKPrintStructSizeTest() {
    printf("\nThe size of struct 'AKOfficials' is %lu bytes\n", sizeof(AKOfficials));
}