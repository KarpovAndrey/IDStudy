//
//  AKDispatcher.h
//  AKStudy
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AKEmployee;

@interface AKDispatcher : NSObject

- (instancetype)initWithStaff:(NSArray *)staff NS_DESIGNATED_INITIALIZER;

- (BOOL)containsEmployee:(AKEmployee *)employee;
- (void)addObject:(id)object;

@end
