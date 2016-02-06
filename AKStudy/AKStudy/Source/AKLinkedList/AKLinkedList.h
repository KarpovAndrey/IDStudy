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
#include "AKString.h"

typedef struct AKNode AKNode;

struct AKNode {
    AKObject _super;
    AKString *_data;
    AKNode *next;
//    uint64_t _counter;
};

extern
void __AKNodeDeallocate(AKNode *list);

extern
void *AKNodeCreate();

extern
void AKNodeSetData(AKNode *node, AKString *data);

extern
char *AKNodeGetData(AKNode *node);

extern
AKNode *AKNodeGetObjectAtIndex(AKNode *head, uint64_t index);

extern
void AKNodePush(AKNode **head, AKString *data);

extern
AKString AKNodePop(AKNode **list);

extern
void AKNodePrintAll(AKNode *list);

#endif /* AKLinkedList_h */
