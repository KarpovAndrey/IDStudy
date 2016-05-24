//
//  AKArrayManager.m
//  AKStudy
//
//  Created by Admin on 22.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKArrayModel.h"
#import "AKArrayManager.h"
#import "AKDispatch.h"
#import "AKStringModel.h"

static NSString * const kAKArrayObjectsStateName    = @"arrayObjectsState.plist";
static NSString * const kAKArrayObjectsKey          = @"arrayObjects";

@interface AKArrayManager ()
@property (nonatomic, readonly)                  NSString       *path;
@property (nonatomic, readonly, getter=isCached) BOOL           cached;

@end

@implementation AKArrayManager

#pragma mark -
#pragma mark Inializations & Deallocations

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addObserverForSaveSelectorWithName:UIApplicationDidEnterBackgroundNotification];
        [self addObserverForSaveSelectorWithName:UIApplicationWillTerminateNotification];
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
#pragma mark Private

- (void)addObserverForSaveSelectorWithName:(NSString *)name {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(save)
                                                 name:name
                                               object:nil];
}

- (void)prepareToLoading {
    AKArrayModel *model = self.isCached ? [NSKeyedUnarchiver unarchiveObjectWithFile:self.path]
                                        : [AKArrayModel arrayModelWithObjects:[AKStringModel randomStringsModel]];
    
    [self addObjects:model.objects];
    
}

- (void)finishLoading {
    self.state = kAKModelLoadedState;
}

#pragma mark -
#pragma mark Public

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

@end