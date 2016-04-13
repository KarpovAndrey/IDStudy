//
//  AKObserverArray.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKObserverDictionary.h"
#import "AKObserverObject.h"
#import "AKObserver.h"

@interface AKObserverArray : NSObject
@property (nonatomic, retain) NSMutableArray *handlersObject;

- (void)addHandler:(AKObjectHandler)handler forObject:(id)object;
- (void)removeHandlersForObject:(id)object;

@end
