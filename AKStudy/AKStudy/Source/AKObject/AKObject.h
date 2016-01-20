//
//  AKObject.h
//  AKStudy
//
//  Created by Admin on 20.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKObject_h
#define AKObject_h

#include <stdio.h>

typedef struct AKObject AKObject;

struct AKObject {
    uint8_t _retainCount;
};

extern
void __AKObjectDeallocate(void *object);

#define AKObjectCreate(type)\
        __AKObjectCreate(sizeof(type), )\

extern
AKObject *__AKObjectCreate(size_t size);

extern
void *AKObjectRetain(void *object);

extern
void AKObjectRelease(void *object);

#endif /* AKObject_h */
