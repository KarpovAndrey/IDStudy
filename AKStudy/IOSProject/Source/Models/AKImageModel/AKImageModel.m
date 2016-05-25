//
//  AKImageModel.m
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKImageModel.h"

@interface AKImageModel ()
@property (nonatomic, strong)     NSURL     *url;
@property (nonatomic, strong)     UIImage   *image;

@end

@implementation AKImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)load {
    if (self.state == kAKModelLoadingState) {
        return;
    }
    
    if (self.state == kAKModelLoadedState) {
        return;
    }
    

}

- (void)dump {
    self.image = nil;
    self.state = kAKModelUnloadedState;
}

- (void)cancel {
    
}

@end
