//
//  AKLinkedListPrivate.h
//  AKStudy
//
//  Created by Admin on 11.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKLinkedListPrivate_h
#define AKLinkedListPrivate_h

#include "AKLinkedList.h"

typedef struct AKLinkedList AKLinkedList;

typedef struct {
    void *previousNode;
    void *node;
    void *object;
} AKLinkedListContext;

typedef bool (*AKLinkedListComparator)(AKNode *node, AKLinkedListContext *context);

extern
uint64_t AKLinkedListGetMutationsCount(AKLinkedList *linkedList);

extern
void *AKLinkedListGetHead(AKLinkedList *linkedList);

extern
AKNode *AKLinkedListGetNodeWithContext(AKLinkedList *linkedList,
                                       AKLinkedListComparator comparator,
                                       AKLinkedListContext *context);

extern
bool AKLinkedListNodeContainsObject(AKLinkedListContext *context);

#endif /* AKLinkedListPrivate_h */
