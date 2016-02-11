//
//  AKEnumerator.h
//  AKStudy
//
//  Created by Admin on 10.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKEnumerator_h
#define AKEnumerator_h

#include <stdio.h>

#include "AKObject.h"
#include "AKLinkedList.h"

typedef struct AKEnumerator AKEnumerator;
typedef struct AKLinkedList AKLinkedList;

struct AKEnumerator {
    AKObject _super;
    AKNode *_currentNode;
    AKLinkedList *_linkedList;
    uint64_t _mutationsCount;
    bool _valid;
};

extern
AKEnumerator *AKEnumeratorCreateWithList(AKLinkedList *linkedList);

extern
bool AKEnumeratorGetIsValid(AKEnumerator *enumerator);

extern
void __AKEnumeratorDeallocate(void *object);

#endif /* AKEnumerator_h */
