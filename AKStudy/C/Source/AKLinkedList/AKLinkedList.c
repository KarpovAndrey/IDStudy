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
#include "AKLinkedListPrivate.h"
#include "AKEnumeratorPrivate.h"

#pragma mark -
#pragma mark Private Declarations

static
void AKLinkedListSetCount(AKLinkedList *linkedList, uint64_t count);

static
uint64_t AKLinkedListGetCount(AKLinkedList *linkedList);

static
void AKLinkedListSetHead(AKLinkedList *linkedList, void *node);

static
void AKLinkedListAddNode(AKLinkedList *linkedList, AKNode *node);

static
void AKLinkedListSetMutationsCount(AKLinkedList *linkedList, uint64_t mutationsCount);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKLinkedListDeallocate(AKLinkedList *linkedList) {
    AKReturnMacro(linkedList);
    AKLinkedListSetHead(linkedList, NULL);
    
    __AKObjectDeallocate(linkedList);
    printf("LinkedList KILLED\n");
}

void *AKLinkedListCreate(void) {
    AKLinkedList *linkedList = AKObjectCreate(AKLinkedList);
    AKLinkedListSetMutationsCount(linkedList, 0);
    AKLinkedListSetCount(linkedList, 0);
    AKLinkedListSetHead(linkedList, NULL);
    
    return linkedList;
}

#pragma mark -
#pragma mark Accessors

void AKLinkedListSetCount(AKLinkedList *linkedList, uint64_t count) {
    AKReturnMacro(linkedList);
    
    AKAssignSetter(linkedList->_count, count);
    uint64_t mutationsCount = AKLinkedListGetMutationsCount(linkedList);
    AKLinkedListSetMutationsCount(linkedList, mutationsCount + 1);
}

uint64_t AKLinkedListGetCount(AKLinkedList *linkedList) {
    return linkedList->_count;
}

void AKLinkedListSetHead(AKLinkedList *linkedList, void *node) {
    AKReturnMacro(linkedList);
    
    AKRetainSetter(linkedList->_head, node);
}

void *AKLinkedListGetHead(AKLinkedList *linkedList) {
    AKReturnNullMacro(linkedList, NULL);
    
    return linkedList->_head;
}

void AKLinkedListSetMutationsCount(AKLinkedList *linkedList, uint64_t mutationsCount) {
    AKReturnMacro(linkedList);
    AKAssignSetter(linkedList->_mutationsCount, mutationsCount);
}

uint64_t AKLinkedListGetMutationsCount(AKLinkedList *linkedList) {
    AKReturnNullMacro(linkedList, 0);
    
    return linkedList->_mutationsCount;
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

bool AKLinkedListContainsObject(AKLinkedList *linkedList, void *object) {
    AKReturnNullMacro(linkedList, NULL);
    
    AKContextCreate(AKLinkedListContext, object);
    
    bool result = AKLinkedListGetNodeWithContext(linkedList,
                                                 AKLinkedListNodeContainsObject,
                                                 context);
    free(context);
    
    return result;
}

void AKLinkedListRemoveObject(AKLinkedList *linkedList, void *object) {
    AKReturnMacro(linkedList);
    AKReturnMacro(object);

    AKContextCreate(AKLinkedListContext, object);
    AKNode *node = AKLinkedListGetNodeWithContext(linkedList,
                                                  AKLinkedListNodeContainsObject,
                                                  context);
    
    AKReturnMacro(node);
    if (node == AKLinkedListGetHead(linkedList)) {
        AKLinkedListSetHead(linkedList, AKNodeGetNextNode(node));
    } else {
        AKNodeSetNextNode(context->previousNode, AKNodeGetNextNode(node));
    }
    AKLinkedListSetCount(linkedList, AKLinkedListGetCount(linkedList) - 1);
    
    free(context);
}

void AKRemoveAllObjects(AKLinkedList *linkedList) {
    AKReturnMacro(linkedList);
    AKLinkedListSetHead(linkedList, NULL);
    AKLinkedListSetCount(linkedList, 0);
}

#pragma mark -
#pragma mark Private Implimentations

void AKLinkedListAddNode(AKLinkedList *linkedList, AKNode *node) {
    AKReturnMacro(linkedList);
    
    AKNodeSetNextNode(node, AKLinkedListGetHead(linkedList));
    AKLinkedListSetHead(linkedList, node);
    AKLinkedListSetCount(linkedList, AKLinkedListGetCount(linkedList) + 1);
}

AKNode *AKLinkedListGetNodeWithContext(AKLinkedList *linkedList,
                                       AKLinkedListComparator comparator,
                                       AKLinkedListContext *context)
{
    AKNode *result = NULL;
    if (linkedList != NULL) {
        AKEnumerator *enumerator = AKEnumeratorCreateWithList(linkedList);
        while (AKEnumeratorGetIsValid(enumerator)
               && AKEnumeratorGetNextNode(enumerator)) {
            AKNode *node = AKEnumeratorGetNode(enumerator);
            
            context->node = node;
            if (true == AKLinkedListNodeContainsObject(context)) {
                result = node;
                break;
            }
            
            context->previousNode = node;
            context->node = AKNodeGetNextNode(node);
        }
        AKObjectRelease(enumerator);
    }

    return result;
}

bool AKLinkedListNodeContainsObject(AKLinkedListContext *context) {
    return context->object == AKNodeGetObject(context->node);
}

