//
//  AKImageModel.m
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKImageModel.h"

static NSString * const kAKImageURLString = @"http://mirgif.com/humor/prikol104.jpg";

@interface AKImageModel ()
@property (nonatomic, readonly)                     NSString    *path;
@property (nonatomic, readonly, getter = isCached)  BOOL        cached;

- (void)deleteIfNeeded;

@end

@implementation AKImageModel

@dynamic cached;
@dynamic path;
//@synthesize imageData;

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

//- (void)complexDownload {
//    NSURL *url = [NSURL URLWithString:kAKImageURLString];
//    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
//                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                          timeoutInterval:60.0];
//    
//    NSURLConnection *theConnection = [NSURLConnection connectionWithRequest:theRequest delegate:self];
//    if (theConnection) {
//        self.imageData = [NSMutableData data];
//    } else {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        NSLog(@"Connection failed");
//    }
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    [imageData appendData:data];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    UIImage *image = [UIImage imageWithData:imageData];
//    self.image = image;
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//    NSLog(@"%@", error);
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//}


- (void)prepareToLoading {
    if (self.isCached) {
        NSURL *url = [NSURL URLWithString:kAKImageURLString];
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];

        //        UIImage *image = [UIImage imageWithContentsOfFile:self.path];
        
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

