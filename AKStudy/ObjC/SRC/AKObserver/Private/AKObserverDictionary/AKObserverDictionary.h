//
//  AKObserverDictionary.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKObserver.h"
#import "AKObserverArray.h"

@interface AKObserverDictionary : NSObject
@property (nonatomic, retain) AKObserverArray *arrayObservers;
@property (nonatomic, assign) NSUInteger state;

- (void)addHandler:(AKObjectHandler)handler forstate:(NSUInteger)state object:(id)object;
- (void)removeHandlersForObject:(id)object;

@end
