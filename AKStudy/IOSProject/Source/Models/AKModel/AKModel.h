//
//  AKModel.h
//  AKStudy
//
//  Created by Admin on 24.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKObserver.h"

typedef NS_ENUM(NSUInteger, AKModelState) {
    kAKModelUndefinedState,
    kAKModelLoadingState,
    kAKModelChangedState,
    kAKModelLoadedState,
    kAKModelUnloadedState
};

@interface AKModel : AKObserver

- (void)load;

@end
