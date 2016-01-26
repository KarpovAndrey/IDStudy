//
//  main.c
//  AKStudy
//
//  Created by Admin on 29.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#include <stdio.h>
#include <string.h>

#include "AKMacroTests.h"
#include "AKStructTests.h"
#include "AKValueBitOutputTests.h"
#include "AKHumanTest.h"
#include "AKString.h"
#include "AKArray.h"

int main(int argc, const char * argv[]) {
//    AKPrintSizeTypeTest();
//    AKPrintOutputValue();
//    AKPrintOutputTypeMacro();
//    
//    AKPrintStructOffsetofTest();
//    AKPrintStructSizeTest();

//    AKPrintingByteValuesTest();
    
//    AKHumanTest();
    AKString *string1 = AKStringCreateWithData("Name1");
    AKString *string2 = AKStringCreateWithData("Name2");
    AKString *string3 = AKStringCreateWithData("Name3");
    AKString *string4 = AKStringCreateWithData("Name4");
    AKString *string5 = AKStringCreateWithData("Name5");
    AKString *string6 = AKStringCreateWithData("Name6");
    AKString *string7 = AKStringCreateWithData("Name1");
    AKString *string8 = AKStringCreateWithData("Name2");
    AKString *string9 = AKStringCreateWithData("Name3");
    AKString *string10 = AKStringCreateWithData("Name4");
    AKString *string11 = AKStringCreateWithData("Name5");
    AKString *string12 = AKStringCreateWithData("Name6");
    AKString *string13 = AKStringCreateWithData("Name1");
    AKString *string14 = AKStringCreateWithData("Name2");
    AKString *string15 = AKStringCreateWithData("Name3");
    AKString *string16 = AKStringCreateWithData("Name4");
    AKString *string17 = AKStringCreateWithData("Name5");
    AKString *string18 = AKStringCreateWithData("Name6");
    AKString *string19 = AKStringCreateWithData("Name1");
    AKString *string20 = AKStringCreateWithData("Name2");

    AKArray *array = __AKArrayCreate();
    AKArraySetObject(array, string1);
    AKArraySetObject(array, string2);
    AKArraySetObject(array, string3);
    AKArraySetObject(array, string4);
    AKArraySetObject(array, string5);
    AKArraySetObject(array, string6);
    AKArraySetObject(array, string7);
    AKArraySetObject(array, string8);
    AKArraySetObject(array, string9);
    AKArraySetObject(array, string10);
    AKArraySetObject(array, string11);
    AKArraySetObject(array, string12);
    AKArraySetObject(array, string13);
    AKArraySetObject(array, string14);
    AKArraySetObject(array, string15);
    AKArraySetObject(array, string16);
    AKArraySetObject(array, string17);
    AKArraySetObject(array, string18);
    AKArraySetObject(array, string19);
    AKArraySetObject(array, string20);
    
//    printf("%d\n", AKArrayGetCountFull(array));
    

    AKArrayRemoveObject(array, string1);
    AKArrayRemoveObject(array, string2);
    AKArrayRemoveObject(array, string3);
    AKArrayRemoveObject(array, string4);
    AKArrayRemoveObject(array, string5);
    AKArrayRemoveObject(array, string6);
//    AKArraySetObject(array, string21);

    printf("%d\n", AKArrayGetCountFull(array));

    
    return 0;
}
