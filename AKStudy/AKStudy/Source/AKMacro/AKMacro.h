//
//  AKMacro.h
//  AKStudy
//
//  Created by Admin on 29.12.15.
//  Copyright © 2015 Admin. All rights reserved.
//

#ifndef AKMacro_h
#define AKMacro_h

#include <assert.h>

#define AKPrintTypeSize(type) printf("The size of '"#type"' is %lu bytes\n", sizeof(type))

#define AKOutputValue(specifier, value) printf("This is "#specifier"\n", value)

#define AKOutputType(type, specifier)\
            void AKOutput_##type(type value) {\
                AKOutputValue(specifier, value);\
            }

#define AKOutputTypeMacro(type, value) AKOutput_##type(value)


#define AKReturnMacro(value) if (value == NULL) {\
                                return;\
                             }\

#define AKReturnNullMacro(value, returnValue) if (value == NULL) {\
                                    return returnValue;\
                                 }\

#define AKReturnZeroMacro(value) if (value == NULL) {\
                                    return 0;\
                                  }\


#define AKRetainSetter(oldValue, newValue) {\
            if (oldValue != newValue) {\
                AKObjectRelease(oldValue);\
                oldValue = newValue;\
                AKObjectRetain(oldValue);\
            }\
        }\

#define AKAssignSetter(oldValue, newValue) {\
            if (oldValue != newValue) {\
                oldValue = newValue;\
            }\
        }\

#endif /* AKMacro_h */
