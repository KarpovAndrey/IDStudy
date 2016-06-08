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
    kAKModelFailedState
};

@interface AKModel : AKObserver

- (void)load;
- (void)dump;

//these methods are called in subclasses
//you should never call these method directly fromoutside subclasses
- (void)prepareToLoading;
- (void)setupLoad;
- (void)finishLoading;
- (void)completeLoading;

@end
