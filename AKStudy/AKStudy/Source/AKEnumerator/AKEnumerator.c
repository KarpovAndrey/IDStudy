//
//  AKEnumerator.c
//  AKStudy
//
//  Created by Admin on 10.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKEnumerator.h"
#include "AKMacro.h"
#include "AKLinkedListPrivate.h"

#pragma mark -
#pragma mark Private Declarations

static
void AKEnumeratorSetList(AKEnumerator *enumerator, AKLinkedList *linkedList);

static
AKLinkedList *AKEnumeratorGetList(AKEnumerator *enumerator);

static
void AKEnumeratorSetCurrentNode(AKEnumerator *enumerator, AKNode *node);

static
AKNode *AKEnumeratorGetCurrentNode(AKEnumerator *enumerator);

static
void AKEnumeratorSetMutationsCount(AKEnumerator *enumerator, uint64_t mutationsCount);

static
uint64_t AKEnumeratorGetMutationsCount(AKEnumerator *enumerator);

static
void AKEnumeratorSetValid(AKEnumerator *enumerator, bool valid);

#pragma mark - 
#pragma mark Initialisations and Deallocations

extern
void __AKEnumeratorDeallocate(void *object) {
    AKEnumeratorSetList(object, NULL);
    AKEnumeratorSetCurrentNode(object, NULL);
    __AKObjectDeallocate(object);
}

extern
AKEnumerator *AKEnumeratorCreateWithList(AKLinkedList *linkedList) {
    AKEnumerator *enumerator = AKObjectCreate(AKEnumerator);
    
    AKEnumeratorSetList(enumerator, linkedList);
    uint64_t mutationsCount = AKLinkedListGetMutationsCount(linkedList);
    AKEnumeratorSetMutationsCount(enumerator, mutationsCount);
    AKEnumeratorSetValid(enumerator, true);
    AKEnumeratorSetCurrentNode(enumerator, NULL);
    
    return enumerator;
}

AKNode *AKEnumeratorGetNextNode(AKEnumerator *enumerator) {
    AKReturnNullMacro(enumerator, NULL);
    
    AKNode *node = AKEnumeratorGetCurrentNode(enumerator);
    AKLinkedList *linkedList = AKEnumeratorGetList(enumerator);

    if (!node) {
        node = AKLinkedListGetHead(linkedList);
        AKEnumeratorSetCurrentNode(enumerator, node);
    } else {
        node = AKNodeGetNextNode(node);
        AKEnumeratorSetCurrentNode(enumerator, node);
    }
    
    uint64_t mutationsCount = AKEnumeratorGetMutationsCount(enumerator);
    
    if (mutationsCount != AKLinkedListGetMutationsCount(linkedList) || !node) {
        AKEnumeratorSetValid(enumerator, false);
    }
    
    return node;
}

#pragma mark -
#pragma mark Accessors

void AKEnumeratorSetList(AKEnumerator *enumerator, AKLinkedList *linkedList) {
    AKReturnMacro(linkedList);
    AKRetainSetter(enumerator->_linkedList, linkedList);
}

AKLinkedList *AKEnumeratorGetList(AKEnumerator *enumerator) {
    return enumerator->_linkedList;
}

void AKEnumeratorSetCurrentNode(AKEnumerator *enumerator, AKNode *node) {
    AKReturnMacro(node);
    AKRetainSetter(enumerator->_currentNode, node);
}

AKNode *AKEnumeratorGetCurrentNode(AKEnumerator *enumerator) {
    return enumerator->_currentNode;
}

void AKEnumeratorSetMutationsCount(AKEnumerator *enumerator, uint64_t mutationsCount) {
    AKAssignSetter(enumerator->_mutationsCount, mutationsCount);
}

uint64_t AKEnumeratorGetMutationsCount(AKEnumerator *enumerator) {
    return enumerator->_mutationsCount;
}

void AKEnumeratorSetValid(AKEnumerator *enumerator, bool valid) {
    AKReturnMacro(enumerator);
    
    AKAssignSetter(enumerator->_valid, valid);
}

bool AKEnumeratorGetIsValid(AKEnumerator *enumerator) {
    AKReturnNullMacro(enumerator, false);
    
    return enumerator->_valid;
}

#pragma mark -
#pragma mark Public


