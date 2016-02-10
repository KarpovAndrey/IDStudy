//
//  AKEnumerator.c
//  AKStudy
//
//  Created by Admin on 10.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKEnumerator.h"
#include "AKMacro.h"

#pragma mark -
#pragma mark Private Declarations

static
void AKEnumeratorSetList(AKEnumerator *enumerator, AKLinkedList *linkedList);

static
AKLinkedList *AKEnumeratorGetList(AKEnumerator *enumerator);

static
void AKEnumeratorSetNode(AKEnumerator *enumerator, AKNode *node);

static
AKNode *AKEnumeratorGetNode(AKEnumerator *enumerator);

static
void AKEnumeratorSetMutationsCount(AKEnumerator *enumerator, uint64_t mutationsCount);

static
uint64_t AKEnumeratorGetMutationsCount(AKEnumerator *enumerator);

#pragma mark - 
#pragma mark Initialisations and Deallocations

extern
void __AKEnumeratorDeallocate(void *object) {
    AKEnumeratorSetList(object, NULL);
    AKEnumeratorSetNode(object, NULL);
    __AKObjectDeallocate(object);
}

extern
AKEnumerator *AKEnumeratorCreateWithList(AKLinkedList *linkedList) {
    AKEnumerator *enumerator = AKObjectCreate(AKEnumerator);
    assert(enumerator);
    AKEnumeratorSetList(enumerator, linkedList);
    AKEnumeratorSetMutationsCount(enumerator, linkedList->mutationsCount);
    
    return enumerator;
}

//void *AKEnumeratorGetNextNode(AKEnumerator *enumerator) {
//    return ;
//}

#pragma mark -
#pragma mark Accessors

void AKEnumeratorSetList(AKEnumerator *enumerator, AKLinkedList *linkedList) {
    AKReturnMacro(linkedList);
    AKRetainSetter(enumerator->_linkedList, linkedList);
}

AKLinkedList *AKEnumeratorGetList(AKEnumerator *enumerator) {
    return enumerator->_linkedList;
}

void AKEnumeratorSetNode(AKEnumerator *enumerator, AKNode *node) {
    AKReturnMacro(node);
    AKRetainSetter(enumerator->_currentNode, node);
}

AKNode *AKEnumeratorGetNode(AKEnumerator *enumerator) {
    return enumerator->_currentNode;
}

void AKEnumeratorSetMutationsCount(AKEnumerator *enumerator, uint64_t mutationsCount) {
    AKAssignSetter(enumerator->_mutationsCount, mutationsCount);
}

uint64_t AKEnumeratorGetMutationsCount(AKEnumerator *enumerator) {
    return enumerator->_mutationsCount;
}

#pragma mark -
#pragma mark Public

extern
bool AKEnumeratorIsValid(AKEnumerator *enumerator) {
    AKReturnNullMacro(enumerator, false);
    
    return enumerator->_isValid;
}
