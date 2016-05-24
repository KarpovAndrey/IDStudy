//
//  AKModel.m
//  AKStudy
//
//  Created by Admin on 24.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKModel.h"
#import "AKDispatch.h"

@interface AKModel ()

- (void)prepareToLoading;
- (void)finishLoading;

@end

@implementation AKModel

#pragma mark -
#pragma mark Private

- (void)prepareToLoading {
    
}

- (void)finishLoading {
    
}

#pragma mark -
#pragma mark Public

- (void)load {
    NSUInteger state = self.state;
    if (state == kAKModelLoadingState) {
        return;
    } else {
        if (state == kAKModelLoadedState) {
            [self finishLoading];
        }
        state = kAKModelLoadingState;
    }
    
    AKWeakify;
    AKDispatchAsyncInBackground(^{
        sleep(3);
        AKStrongifyAndReturnIfNil(AKModel);
        
        [strongSelf prepareToLoading];
        AKDispatchAsyncOnMainThread(^{
            [strongSelf finishLoading];
        });
    });
}

@end
