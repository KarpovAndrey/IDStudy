//
//  AKQueue.h
//  AKStudy
//
//  Created by Admin on 03.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKQueue : NSObject
@property (nonatomic, readonly) NSArray *queue;

- (void)pushObject:(id)object;
- (id)popObject;

@end
