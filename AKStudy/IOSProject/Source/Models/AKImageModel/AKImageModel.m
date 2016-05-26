//
//  AKImageModel.m
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKImageModel.h"

@implementation AKImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSString *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithURL:(NSString *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)prepareToLoading {
//    NSData *imageData = [[NSData alloc] initWithContentsOfURL:self.url];
//    self.image = [[UIImage alloc] initWithData:imageData];
//    self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
    self.image = [UIImage imageWithContentsOfFile:self.url];
}

- (void)finishLoading {
    [self setState:kAKModelLoadedState withObject:self.image];
}

@end

