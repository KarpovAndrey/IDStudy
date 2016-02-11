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

extern
uint64_t AKLinkedListGetMutationsCount(AKLinkedList *linkedList);

extern
void *AKLinkedListGetHead(AKLinkedList *linkedList);

#endif /* AKLinkedListPrivate_h */
