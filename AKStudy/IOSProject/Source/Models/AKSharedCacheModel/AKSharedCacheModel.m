//
//  AKSharedCacheModel.m
//  AKStudy
//
//  Created by Admin on 02.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKSharedCacheModel.h"

static NSString * const kAKSharedCacheModelName    = @"sharedCache.plist";
static NSString * const kAKSharedCacheModelKey   = @"sharedCache";

static AKSharedCacheModel * model = nil;

@interface AKSharedCacheModel ()
@property (nonatomic, strong)   NSMutableDictionary     *cachedFiles;
@property (nonatomic, readonly) NSString                *path;
@property (nonatomic, readonly) NSArray                 *notificationsKeys;

@property (nonatomic, readonly, getter=isCached) BOOL   cached;

- (void)addObserversWithKeys:(NSArray *)keys;
- (void)removeObserversWithKeys:(NSArray *)keys;
- (void)save;

@end

@implementation AKSharedCacheModel

@dynamic path;
@dynamic notificationsKeys;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedCache {
    static dispatch_once_t once_token = 0;
    dispatch_once(&once_token, ^{
        AKSharedCacheModel *newModel = [self new];
        model = [NSKeyedUnarchiver unarchiveObjectWithFile:newModel.path];
        
        if (!model) {
            model = [self new];
            model.cachedFiles = [NSMutableDictionary dictionary];
        }
        
        [model addObserversWithKeys:model.notificationsKeys];
    });
    
    return model;
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (void)dealloc {
    [self removeObserversWithKeys:self.notificationsKeys];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)path {
    return [NSFileManager pathToFileWithName:kAKSharedCacheModelName];
}

- (NSArray *)notificationsKeys {
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

- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

#pragma mark -
#pragma mark Public

- (NSString *)keyForValue:(NSString *)value {
    NSArray *keys = self.cachedFiles.allKeys;
    NSDictionary *dictionary = [self.cachedFiles copy];
    for (NSString *key in keys) {
        if ([[dictionary objectForKey:key] isEqualToString:value]) {
            return key;
        }
    }
    
    return nil;
}

- (BOOL)isCahedForKey:(NSString *)key {
    return [self.cachedFiles objectForKey:key];
}

- (void)addValueForKey:(NSString *)key {
    @synchronized (self) {
        if ([self isCahedForKey:key]) {
            return;
        } else {
            NSString *stringValue = [key lastPathComponent];
            NSString *stringKey = [self keyForValue:stringValue];
            if (stringKey) {
                [self removeValueForKey:stringKey];
            }
            
            [self.cachedFiles setObject:stringValue forKey:key];
        }
    }
}

- (void)removeValueForKey:(NSString *)key {
    @synchronized (self) {
        [self.cachedFiles removeObjectForKey:key];
    }
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.cachedFiles forKey:kAKSharedCacheModelKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.cachedFiles = [aDecoder decodeObjectForKey:kAKSharedCacheModelKey];
    }
    
    return self;
}

@end
