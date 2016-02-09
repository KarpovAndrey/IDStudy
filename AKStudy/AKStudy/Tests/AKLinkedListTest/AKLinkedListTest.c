//
//  AKLinkedListTest.c
//  AKStudy
//
//  Created by Admin on 09.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#include "AKLinkedListTest.h"
#include "AKLinkedList.h"
#include "AKNode.h"

void AKLinkedListTest() {
    AKLinkedList *list = AKLinkedListCreate();
    AKLinkedListAddObject(list, AKNodeCreateWithObject(AKStringCreateWithData("Hello")));
    AKLinkedListAddObject(list, AKNodeCreateWithObject(AKStringCreateWithData("People")));

}