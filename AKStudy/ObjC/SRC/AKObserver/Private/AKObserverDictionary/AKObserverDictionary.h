//
//  AKObserverDictionary.h
//  AKStudy
//
//  Created by Admin on 13.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKObserverArray.h"
#import "AKObserver.h"

@interface AKObserverDictionary : NSObject
@property (nonatomic, assign) NSUInteger state;
@property (nonatomic, retain) AKObserverArray *arrayObjects;

- (void)addHandler:(AKObjectHandler)handler forstate:(NSUInteger)state object:(id)object;

@end
