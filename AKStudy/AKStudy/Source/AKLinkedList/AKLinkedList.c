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

//static
//void AKNodeSetCounter(AKNode *node, uint64_t counter);
//
//static
//uint64_t AKNodeGetCounter(AKNode *node);

#pragma mark -
#pragma mark Initializations and Deallocations

void __AKNodeDeallocate(AKNode *Node) {
    AKReturnMacro(Node);
    AKNodeSetData(Node, NULL);
    __AKObjectDeallocate(Node);
    printf("Node KILLED\n");
}

void *AKNodeCreate() {
    AKNode *list = AKObjectCreate(AKNode);
//    AKNodeSetCounter(node, 0);

    return list;
}

#pragma mark -
#pragma mark Accessors

void AKNodeSetData(AKNode *node, AKString *data) {
    AKReturnMacro(node);
    AKReturnMacro(data);
    
    AKRetainSetter(node->_data, data);
}

char *AKNodeGetData(AKNode *node) {
    AKReturnNullMacro(node, NULL);
    
    return (char *)node->_data;
}

//void AKNodeSetCounter(AKNode *node, uint64_t counter) {
//    AKAssignSetter(node->_counter, counter);
//}
//
//uint64_t AKNodeGetCounter(AKNode *node) {
//    return node->_counter;
//}

#pragma mark -
#pragma mark Private

#pragma mark -
#pragma mark Public

void AKNodePrintAll(AKNode *list) {
    AKNode *p;
    for (p = list; p != NULL; p = p->next) {
        printf("%s\n", (char *)p->_data);
    }
}

void AKNodePush(AKNode **head, AKString *data) {
    AKNode *node = (AKNode *) malloc(sizeof(AKNode)); //create new Node and allocate space for it
    //AKNodeSetData(node, data);
    node->_data = data; // write data to it
    node->next = *head; // assign pointer Node to address of the previous Node
    *head = node; // assign to the pointer head address of the new Noda
}


AKNode *AKNodeGetObjectAtIndex(AKNode *head, uint64_t index) {
    uint64_t counter = 0;
    while (counter < index && head) {
        head = head->next;
        counter++;
    }
    return head;
}

AKString AKNodePop(AKNode **list) {
    AKString res = *(*list)->_data;
    AKNode *p = *list;
    *list = (*list)->next;
    free(p);

    return res;
}