//
//  AKHumanObject.h
//  AKStudy
//
//  Created by Admin on 18.02.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kAKUndefined,
    kAKManGender,
    kAKWomanGender
} AKHumanGender;

@interface AKHumanObject : NSObject

- (instancetype)initWithName;
- (void)sayHello;

@property(nonatomic, copy)   NSString       *name;
@property(nonatomic, assign) AKHumanGender  gender;
@property(nonatomic, assign) uint16_t       age;
@property(nonatomic, assign) float          weight;
@property(nonatomic, retain) NSMutableArray *children;

@end


//Есть существо, у существа есть typedef пола, есть строка имени, есть масса, есть возраст, есть массив детей. Существо умеет воевать и рожать детей. При родах существо не добавляет к себе ребенка автоматом. Существо умеет добавит к себе детей и удалить. Существо умеет говорить "Привет!", причем, когда существо говорит привет, то сначала говорит оно, а потом все его дети (значит и дети детей, и т.д.).
//Задание:
//1. Написать класс существа;