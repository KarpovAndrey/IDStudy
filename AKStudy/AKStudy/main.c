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

int main(int argc, const char * argv[]) {
    AKPrintSizeTypeTest();
    AKPrintOutputValue();
    AKPrintOutputTypeMacro();
    
    AKPrintStructOffsetofTest();
    AKPrintStructSizeTest();
    
    return 0;
}
