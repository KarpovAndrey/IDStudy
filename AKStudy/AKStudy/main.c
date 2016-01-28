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
#include "AKStringTest.h"
#include "AKArrayTest.h"

#include "AKHuman.h"
#include "AKObject.h"
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
    //AKHumanTest();
//    AKArrayTest();
    
    AKHuman *humanMan = AKHumanCreateWithNameAndGender(AKStringCreateWithData("Man"), kAKManGender);
    AKHuman *humanWoman = AKHumanCreateWithNameAndGender(AKStringCreateWithData("Woman"), kAKWomanGender);
    
    AKHuman *humanKinder1 = AKHumanCreateWithNameAndParents(AKStringCreateWithData("Kinder1"), humanMan, humanWoman);
    AKHuman *humanKinder2 = AKHumanCreateWithNameAndParents(AKStringCreateWithData("Kinder1"), humanMan, humanWoman);
    AKHuman *humanKinder3 = AKHumanCreateWithNameAndParents(AKStringCreateWithData("Kinder1"), humanMan, humanWoman);

    AKHumanRemoveChild(humanMan, humanKinder1);
    AKHumanRemoveChild(humanMan, humanKinder2);
    return 0;
}
