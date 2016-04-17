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
                AKObjectRetain(newValue);\
                AKObjectRelease(oldValue);\
                oldValue = newValue;\
            }\
        }\

#define AKAssignSetter(oldValue, newValue) {\
            if (oldValue != newValue) {\
                oldValue = newValue;\
            }\
        }\

#define AKContextCreate(type,object)\
        type *context = calloc(1, sizeof(type));\
        assert(context);\
        context->object = object;\

#define AKWeakSelf(selfClass)\
            __weak selfClass *weakSelf = self;\

#define AKStrongSelf(selfClass)\
        __strong selfClass *strongSelf = weakSelf;\
            if (!strongSelf)\
                return;\

#endif /* AKMacro_h */
