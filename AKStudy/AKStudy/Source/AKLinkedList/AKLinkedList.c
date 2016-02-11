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
void AKLinkedListRemoveNode(AKLinkedList *linkedList, AKNode *node);

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
    
    AKEnumerator *enumerator = AKEnumeratorCreateWithList(linkedList);
    
    bool containsObject = false;
    while (AKEnumeratorGetIsValid(enumerator)) {
        AKNode * node = AKLinkedListGetHead(linkedList);
        
        if (AKNodeGetObject(node) == object) {
            containsObject = true;
            break;
        }
        
        node = AKNodeGetNextNode(node);
    }
    
    AKObjectRelease(enumerator);
    
    return containsObject;
    
//    AKNode * node = AKLinkedListGetHead(linkedList);
//    do {
//        if (AKNodeGetObject(node) == object) {
//            return true;
//        }
//        
//        node = AKNodeGetNextNode(node);
//    } while (NULL != node);
//    
//    return false;
}

void AKLinkedListRemoveObject(AKLinkedList *linkedList, void *object) {
    AKReturnMacro(linkedList);
    AKReturnMacro(object);
    
    AKEnumerator *enumerator = AKEnumeratorCreateWithList(linkedList);
    
    while (AKEnumeratorGetIsValid(enumerator)) {
        AKNode *node = AKEnumeratorGetNextNode(enumerator);
        
        if (object == AKNodeGetObject(node)) {
            AKLinkedListRemoveNode(linkedList, node);
            break;
        }
    //    if (AKLinkedListContainsObject(linkedList, object)) {
    //        AKNode *node = AKLinkedListGetHead(linkedList);
    //        AKNode *nextNode = AKNodeGetNextNode(node);
    //
    //        do {
    //            if (object == AKNodeGetObject(node)) {
    //                AKLinkedListRemoveNode(linkedList, node);
    //                break;
    //            }
    //
    //            node = nextNode;
    //            nextNode = AKNodeGetNextNode(node);
    //        } while (NULL != node);
    //    }
        
    }
    
    AKObjectRelease(enumerator);
    
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

void AKLinkedListRemoveNode(AKLinkedList *linkedList, AKNode *node) {
    AKReturnMacro(linkedList);
    
    if (node == AKLinkedListGetHead(linkedList)) {
        AKLinkedListSetHead(linkedList, AKNodeGetNextNode(node));
    } else {
        AKEnumerator *enumerator = AKEnumeratorCreateWithList(linkedList);
        while (AKEnumeratorGetIsValid(enumerator)) {
            AKNode *firstNode = AKEnumeratorGetNextNode(enumerator);
            AKNode *secondNode = AKNodeGetNextNode(firstNode);
            if (firstNode == secondNode) {
                AKNodeSetNextNode(firstNode, AKNodeGetNextNode(secondNode));
            }
            
        }
        
        AKObjectRelease(enumerator);
    }
    
    AKLinkedListSetCount(linkedList, AKLinkedListGetCount(linkedList) - 1);

//    AKNode *firstNode = AKLinkedListGetHead(linkedList);
//    AKNode *secondNode = AKNodeGetNextNode(firstNode);
//
//    if (firstNode == node) {
//        AKLinkedListSetHead(linkedList, AKNodeGetNextNode(node));
//    } else {
//        while (secondNode != node) {
//            firstNode = secondNode;
//            secondNode = AKNodeGetNextNode(secondNode);
//        }
//    }
//    
//    AKNodeSetNextNode(firstNode, AKNodeGetNextNode(secondNode));
//    AKLinkedListSetCount(linkedList, AKLinkedListGetCount(linkedList) - 1);
}

