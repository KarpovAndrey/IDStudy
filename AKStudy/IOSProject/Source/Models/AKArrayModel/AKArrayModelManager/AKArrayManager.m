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
@property (nonatomic, readonly) NSString       *path;
@property (nonatomic, readonly) NSArray        *keys;

@property (nonatomic, readonly, getter=isCached) BOOL cached;

- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithKeys:(NSArray *)keys;

@end


@implementation AKArrayManager

@dynamic keys;

#pragma mark -
#pragma mark Inializations & Deallocations

- (void)dealloc {
    [self removeObserversWithKeys:self.keys];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addObserversWithKeys:self.keys];
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

- (NSArray *)keys {
    return @[UIApplicationDidEnterBackgroundNotification, UIApplicationWillTerminateNotification];
}

#pragma mark -
#pragma mark Private

- (void)addObserversWithKeys:(NSArray *)keys {
    for (NSString *key in keys) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:key
                                                   object:nil];
    }
}

- (void)removeObserversWithKeys:(NSArray *)keys {
    for (NSString *key in keys) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:key
                                                      object:nil];
    }
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