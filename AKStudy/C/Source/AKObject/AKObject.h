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

typedef void (AKObjectDeallocator)(void *object);

struct AKObject {
    uint64_t _retainCount;
    AKObjectDeallocator *_deallocator;
};

extern
void __AKObjectDeallocate(void *object);

#define AKObjectCreate(type)\
        __AKObjectCreate(sizeof(type), (AKObjectDeallocator *)__##type##Deallocate)\

extern
void *__AKObjectCreate(size_t size, AKObjectDeallocator *_deallocator);

extern
void *AKObjectRetain(void *object);

extern
void AKObjectRelease(void *object);

#endif /* AKObject_h */
