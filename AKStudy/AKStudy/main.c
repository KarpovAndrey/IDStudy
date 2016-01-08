//
//  main.c
//  AKStudy
//
//  Created by Admin on 29.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#include <stdio.h>
#include "AKMacroTests.h"
#include "AKStructTests.h"
#include "AKValueBitOutputTests.h"
#include "AKHuman.h"

int main(int argc, const char * argv[]) {
//    AKPrintSizeTypeTest();
//    AKPrintOutputValue();
//    AKPrintOutputTypeMacro();
//    
//    AKPrintStructOffsetofTest();
//    AKPrintStructSizeTest();

//    AKPrintingByteValuesTest();
  
    AKHumans *human= AKHumansCreate();
    AKHumanSetName(human, "Sergey");
 //   AKHumanSetAge(human, 35);
    
    puts(AKHumanGetName(human));
 //   puts(AKHumanGetAge(human));

    return 0;
}
