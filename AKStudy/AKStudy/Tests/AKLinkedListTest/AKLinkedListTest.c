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
#include "AKString.h"
#include "AKObject.h"
#include "AKEnumerator.h"

void AKLinkedListTest() {
    AKLinkedList *list = AKLinkedListCreate();
    
    AKString *string1 = AKStringCreateWithData("Hello");
    AKString *string2 = AKStringCreateWithData("People");

//    AKNode *node1 = AKNodeCreateWithObject(string1);
//    AKNode *node2 = AKNodeCreateWithObject(string2);

    AKLinkedListAddObject(list, string1);
    AKLinkedListAddObject(list, string2);


    AKLinkedListRemoveObject(list, string1);
}