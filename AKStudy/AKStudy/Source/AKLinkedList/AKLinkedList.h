//
//  AKLinkedList.h
//  AKStudy
//
//  Created by Admin on 06.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKLinkedList_h
#define AKLinkedList_h

#include <stdio.h>

#include "AKObject.h"
#include "AKNode.h"
#include "AKString.h"
#include "AKEnumerator.h"

typedef struct AKLinkedList AKLinkedList;

typedef struct AKEnumerator AKEnumerator;

struct AKLinkedList {
    AKObject _super;
    AKNode *_head;
    uint64_t _count;
    uint64_t mutationsCount;
};

extern
void *AKLinkedListCreate(void);

extern
void AKLinkedListAddObject(AKLinkedList *linkedList, void *object);

extern
void AKLinkedListRemoveObject(AKLinkedList *linkedList, void *object);

extern
void AKRemoveAllObjects(AKLinkedList *linkedList);

extern
void *AKLinkedListGetFirstObject(AKLinkedList *linkedList);

extern
void *AKLinkedListGetLastObject(AKLinkedList *linkedList);

extern
bool AKLinkedListContainsObject(AKLinkedList *linkedList, void *object);

extern
AKEnumerator *AKLinkedListEnumeratorFromList(AKLinkedList *linkedList);

#endif /* AKLinkedList_h */
