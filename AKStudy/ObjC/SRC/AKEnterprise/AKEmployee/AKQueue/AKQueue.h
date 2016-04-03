//
//  AKQueue.h
//  AKStudy
//
//  Created by Admin on 03.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKQueue : NSObject
@property (nonatomic, retain) NSMutableArray *queue;

- (void)addObjectToQueue:(id)object;
- (void)removeObjectFromQueue:(id)object;
- (id)objectFromQueue;

@end
