//
//  AKImageModel.m
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKImageModel.h"
#import "AKDispatch.h"

@interface AKImageModel ()
@property (nonatomic, readonly, getter = isCached)  BOOL        cached;
@property (nonatomic, readonly)                     NSString    *fileName;
@property (nonatomic, readonly)                     NSString    *path;

@property (nonatomic, strong)   NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;

- (void)deleteIfNeeded;
- (void)performDownload;

@end

@implementation AKImageModel

@dynamic fileName;
@dynamic path;
@dynamic cached;

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setURL:(NSURL *)URL {
    if (_URL != URL) {

        if (![_URL isEqual:URL]) {
            _URL = URL;

            [self dump];
        }
    }
    
    [self load];
}

- (void)setTask:(NSURLSessionDownloadTask *)task {
    if (_task != task) {
        [_task cancel];
        
        _task = task;
        [_task resume];
    }
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

- (NSString *)fileName {
    return [[self.URL absoluteString] lastPathComponent];
}

- (NSString *)path {
    return [NSFileManager pathToFileWithName:self.fileName];
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
        
        [self finishLoading];
    } else {
        [self performDownload];
    }
}

- (void)dump {
    self.state = kAKModelUndefinedState;
}

- (void)performDownload {
    self.task = [self.session downloadTaskWithURL:self.URL
                                completionHandler:^ (NSURL *location, NSURLResponse *response, NSError *error)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURL *URL = [NSURL fileURLWithPath:self.path];
        [fileManager copyItemAtURL:location toURL:URL error:nil];
        self.image = [UIImage imageWithContentsOfFile:self.path];
                     
        [self finishLoading];
    }];
}

- (void)finishLoading {
    AKWeakify;
    AKDispatchAsyncOnMainThread(^{
        AKStrongifyAndReturnIfNil(AKImageModel);
        NSUInteger state = strongSelf.image ? kAKModelLoadedState : kAKModelFailedState;
        [strongSelf setState:state withObject:strongSelf.image];
    });
}

@end

