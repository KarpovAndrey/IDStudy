//
//  AKLinkedList.c
//  AKStudy
//
//  Created by Admin on 06.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include <stdlib.h>
#include <string.h>

#include "AKLinkedList.h"
#include "AKMacro.h"

#pragma mark -
#pragma mark Private Declarations

static
void AKLinkedListSetCount(AKLinkedList *linkedList, uint64_t count);

static
uint64_t AKLinkedListGetCount(AKLinkedList *linkedList);

static
void AKLinkedListSetHead(AKLinkedList *linkedList, void *node);

static
void *AKLinkedListGetHead(AKLinkedList *linkedList);

static
AKNode *AKLinkedListGetLastNode(AKLinkedList *linkedList);

static
void AKLinkedListAddNode(AKLinkedList *linkedList, AKNode *node);

static
void AKLinkedListRemoveNode(AKLinkedList *linkedList, AKNode *node);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKLinkedListDeallocate(AKLinkedList *linkedList) {
    AKReturnMacro(linkedList);
    AKLinkedListSetHead(linkedList, NULL);
    __AKObjectDeallocate(linkedList);
    printf("Node KILLED\n");
}

void *AKLinkedListCreate(void) {
    AKLinkedList *linkedList = AKObjectCreate(AKLinkedList);
    AKLinkedListSetCount(linkedList, 0);
    AKLinkedListSetHead(linkedList, NULL);
    
    return linkedList;
}

#pragma mark -
#pragma mark Accessors

void AKLinkedListSetCount(AKLinkedList *linkerList, uint64_t count) {
    AKReturnMacro(linkerList);
    
    AKAssignSetter(linkerList->_count, count);
}

uint64_t AKLinkedListGetCount(AKLinkedList *linkerList) {
    return linkerList->_count;
}

void AKLinkedListSetHead(AKLinkedList *linkedList, void *node) {
    AKReturnMacro(linkedList);
    
    AKRetainSetter(linkedList->_head, node);
}

void *AKLinkedListGetHead(AKLinkedList *linkedList) {
    AKReturnNullMacro(linkedList, NULL);
    
    return linkedList->_head;
}

#pragma mark -
#pragma mark Public

void AKLinkedListAddObject(AKLinkedList *linkedList, void *object) {
    AKReturnMacro(linkedList);
    
    AKNode *node = AKNodeCreateWithObject(object);
    AKLinkedListAddNode(linkedList, node);
    
    AKObjectRelease(node);
}

void *AKLinkedListGetFirstObject(AKLinkedList *linkedList) {
    AKReturnNullMacro(linkedList, NULL);
    
    AKNode *node = AKLinkedListGetHead(linkedList);
    
    return node ? AKNodeGetObject(node) : NULL;
}

void *AKLinkedListGetLastObject(AKLinkedList *linkedList) {
    AKReturnNullMacro(linkedList, NULL);
    
    AKNode  *node = AKLinkedListGetLastNode(linkedList);
    
    return node ? AKNodeGetObject(node) : NULL;
}

bool AKLinkedListContainsObject(AKLinkedList *linkedList, void *object) {
    AKReturnNullMacro(linkedList, NULL);
    
    AKNode * node = AKLinkedListGetHead(linkedList);
    do {
        if (AKNodeGetObject(node) == object) {
            return true;
        }
        
        node = AKNodeGetNextNode(node);
    } while (NULL != node);
    
    return false;
}

void AKLinkedListRemoveObject(AKLinkedList *linkedList, void *object) {
    AKReturnMacro(linkedList);
    
    if (AKLinkedListContainsObject(linkedList, object)) {
        AKNode *node = AKLinkedListGetHead(linkedList);
        AKNode *nextNode = AKNodeGetNextNode(node);
        
        do {
            if (object == AKNodeGetObject(node)) {
                AKLinkedListRemoveNode(linkedList, node);
                break;
            }
            
            node = nextNode;
            nextNode = AKNodeGetNextNode(node);
        } while (NULL != node);
    }
}

void AKRemoveAllObjects(AKLinkedList *linkedList) {
    AKReturnMacro(linkedList);
    AKLinkedListSetHead(linkedList, NULL);
    AKLinkedListSetCount(linkedList, 0);
}

#pragma mark -
#pragma mark Private Implimentations

AKNode *AKLinkedListGetLastNode(AKLinkedList *linkedList) {
    AKReturnNullMacro(linkedList, NULL);
    
    AKNode *node = AKLinkedListGetHead(linkedList);
    while (NULL != AKNodeGetNextNode(node)) {
        node = AKNodeGetNextNode(node);
    }
    
    return node;
}

void AKLinkedListAddNode(AKLinkedList *linkedList, AKNode *node) {
    AKReturnMacro(linkedList);
    
    AKNodeSetNextNode(node, AKLinkedListGetHead(linkedList));
    AKLinkedListSetHead(linkedList, node);
    AKLinkedListSetCount(linkedList, AKLinkedListGetCount(linkedList) + 1);
}

void AKLinkedListRemoveNode(AKLinkedList *linkedList, AKNode *node) {
    AKReturnMacro(linkedList);
    
    AKNode *firstNode = AKLinkedListGetHead(linkedList);
    AKNode *secondNode = AKNodeGetNextNode(node);
    
    if (firstNode == node) {
        AKLinkedListSetHead(linkedList, AKNodeGetNextNode(node));
    } else {
        while (secondNode != node) {
            firstNode = secondNode;
            secondNode = AKNodeGetNextNode(secondNode);
        }
    }
    
    AKNodeSetNextNode(firstNode, AKNodeGetNextNode(secondNode));
    AKLinkedListSetCount(linkedList, AKLinkedListGetCount(linkedList) - 1);
}

