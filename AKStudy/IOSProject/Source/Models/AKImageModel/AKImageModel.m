//
//  AKImageModel.m
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKImageModel.h"

@interface AKImageModel ()
@property (nonatomic, readonly)                     NSString    *path;
@property (nonatomic, readonly, getter = isCached)  BOOL        cached;

- (void)deleteIfNeeded;

@end

@implementation AKImageModel

@dynamic cached;
@dynamic path;

#pragma mark -
#pragma mark Accessors

- (void)setURL:(NSURL *)URL {
    if (_URL != URL) {
        _URL = URL;
        
        if (![_URL isEqual:URL]) {
            [self dump];
        }
    }
    
    [self load];
}

- (NSString *)path {
    return self.URL.path;
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Private

- (void)deleteIfNeeded {
    if (self.isCached) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:self.path error:&error];
    }
}

#pragma mark -
#pragma mark Public

- (void)prepareToLoading {
    if (self.isCached) {
        UIImage *image = [UIImage imageWithContentsOfFile:self.path];
        
        if (image) {
            self.image = image;
        } else {
            [self deleteIfNeeded];
        }
    }
}

- (void)finishLoading {
    NSUInteger state = self.image ? kAKModelLoadedState : kAKModelFailedState;
    [self setState:state withObject:self.image];
}

- (void)dump {
    self.state = kAKModelUndefinedState;
}

@end

