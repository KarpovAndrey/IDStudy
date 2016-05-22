//
//  AKArrayModelManager.m
//  AKStudy
//
//  Created by Admin on 22.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKArrayModel.h"
#import "AKArrayModelManager.h"
#import "AKDispatch.h"
#import "AKStringModel.h"

static NSString * const kAKArrayObjectsStateName    = @"arrayObjectsState.plist";
static NSString * const kAKArrayObjectsManagerKey   = @"arrayObjectsManager";

@interface AKArrayManager ()
@property (nonatomic, strong)                    NSMutableArray          *arrayObjects;
@property (nonatomic, copy)                      NSString                *path;
@property (nonatomic, readonly, getter=isCached) BOOL                    cached;

@end

@implementation AKArrayModelManager

@synthesize arrayObjects;

#pragma mark -
#pragma mark Inializations & Deallocations

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveArrayModel)
                                                     name:UIApplicationWillResignActiveNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveArrayModel)
                                                     name:UIApplicationWillTerminateNotification object:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

- (NSString *)path {
    return [NSFileManager pathToFileWithName:kAKArrayObjectsStateName];
}

#pragma mark -
#pragma mark Public

- (void)loadArrayModel {
    if (self.state == kAKArrayModelLoadingState) {
        return;
    } else {
        self.state = kAKArrayModelLoadingState;
    }
    
    AKWeakify(AKArrayModel);
    AKDispatchAsyncInBackground(^ {
        
        sleep(3);
        
        AKStrongifyAndReturnIfNil(AKArrayModel);
        
        AKArrayModel *model = self.isCached ? [NSKeyedUnarchiver unarchiveObjectWithFile:self.path]
        : [AKArrayModel arrayModelWithObjects:[AKStringModel randomStringsModel]];
        [strongSelf addObjects:model.objects];
        
        AKDispatchAsyncOnMainThread(^ {
            strongSelf.state = kAKArrayModelLoadedState;
        });
    });
    
}

- (void)saveArrayModel {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.arrayObjects forKey:kAKArrayObjectsManagerKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        self.arrayObjects = [aDecoder decodeObjectForKey:kAKArrayObjectsManagerKey];
    }
    
    return self;
}

@end