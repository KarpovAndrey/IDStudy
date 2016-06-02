//
//  AKModel.m
//  AKStudy
//
//  Created by Admin on 24.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKModel.h"
#import "AKDispatch.h"

@implementation AKModel

#pragma mark -
#pragma mark Public

- (void)prepareToLoading {
    
}

- (void)finishLoading {
    
}

- (void)completeLoading {
    [self finishLoading];
}


- (void)dump {
    
}

- (void)load {
    NSUInteger state = self.state;
    if (state == kAKModelLoadingState) {
        return;
    }
    
    if (state == kAKModelLoadedState) {
        [self finishLoading];
        
        return;
    }
    
    self.state = kAKModelLoadingState;
    
    AKWeakify;
    AKDispatchAsyncInBackground(^{
        AKStrongifyAndReturnIfNil(AKModel);
        sleep(1);

        [strongSelf prepareToLoading];

        AKDispatchAsyncOnMainThread(^{
            [strongSelf completeLoading];
        });
    });
}

@end
