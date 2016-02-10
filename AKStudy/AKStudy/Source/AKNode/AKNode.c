//
//  AKNode.c
//  AKStudy
//
//  Created by Admin on 09.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKNode.h"
#include "AKMacro.h"


#pragma mark -
#pragma mark Private

void __AKNodeDeallocate(AKNode *node);

#pragma mark -
#pragma mark Initialisations and Deallocations

void __AKNodeDeallocate(AKNode *node) {
    AKReturnMacro(node);
    AKNodeSetObject(node, NULL);
    __AKObjectDeallocate(node);
    printf("Node KILLED\n");
}

void *AKNodeCreateWithObject(void *object) {
    AKNode *node = AKObjectCreate(AKNode);
    AKNodeSetObject(node, object);
    AKNodeSetNextNode(node, NULL);
    
    return node;
}

#pragma mark -
#pragma mark - Accessors

void AKNodeSetObject(AKNode *node, void *object) {
    AKReturnMacro(node);
    AKReturnMacro(object);
    
    AKRetainSetter(node->_object, object);
}

void *AKNodeGetObject(AKNode *node) {
    return node->_object;
}

void AKNodeSetNextNode(AKNode *node, AKNode *nextNode) {
    AKReturnMacro(node);
    AKReturnMacro(nextNode);
    
    AKRetainSetter(node->_nextNode, nextNode);
}

void *AKNodeGetNextNode(AKNode *node) {
    return node->_nextNode;
}

