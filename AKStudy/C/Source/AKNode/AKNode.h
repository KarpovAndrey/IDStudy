//
//  AKNode.h
//  AKStudy
//
//  Created by Admin on 09.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#ifndef AKNode_h
#define AKNode_h

#include <stdio.h>

#include "AKObject.h"

typedef struct AKNode AKNode;

struct AKNode {
    AKObject _super;
    AKNode *_nextNode;
    void *_object;
};

extern
void *AKNodeCreateWithObject(void *object);

extern
void AKNodeSetObject(AKNode *node, void *object);

extern
void *AKNodeGetObject(AKNode *node);

extern
void AKNodeSetNextNode(AKNode *node, AKNode *nextNode);

extern
void *AKNodeGetNextNode(AKNode *node);

#endif /* AKNode_h */
