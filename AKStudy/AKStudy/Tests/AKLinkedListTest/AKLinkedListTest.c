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
    AKString *string3 = AKStringCreateWithData("Hello");
    AKString *string4 = AKStringCreateWithData("People");
    AKString *string5 = AKStringCreateWithData("People");

    AKLinkedListAddObject(list, string1);
    AKLinkedListAddObject(list, string2);
    AKLinkedListAddObject(list, string3);
    AKLinkedListAddObject(list, string4);
    AKLinkedListAddObject(list, string5);

    AKLinkedListRemoveObject(list, string3);
    AKLinkedListRemoveObject(list, string4);

}