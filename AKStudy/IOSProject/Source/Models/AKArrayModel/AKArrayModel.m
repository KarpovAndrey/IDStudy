//
//  AKArrayModel.m
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKArrayModel.h"
#import "AKStringModel.h"
#import "AKStateModel.h"
#import "AKDispatch.h"

static NSString * const kAKArrayObjectsKey          = @"arrayObjects";
static NSString * const kAKArrayObjectsStateName    = @"arrayObjectsState.plist";

@interface AKArrayModel ()
@property (nonatomic, strong) NSMutableArray *arrayObjects;
@property (nonatomic, copy)   NSString       *path;
@property (nonatomic, readonly, getter=isCached) BOOL cached;

@end

@implementation AKArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)arrayModelWithObject:(id)object {
    return [[self alloc] initWithObject:object];
}

+ (instancetype)arrayModelWithObjects:(NSArray *)objects {
    return [[self alloc] initWithObjects:objects, nil];
}

#pragma mark -
#pragma mark Initializations & Deallocations

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.arrayObjects = [NSMutableArray arrayWithObject:object];
    }
    
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        self.arrayObjects = [NSMutableArray arrayWithArray:objects];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.arrayObjects.count;
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:kAKArrayObjectsKey];
}

- (NSString *)path {
    return [NSFileManager pathToFileWithName:kAKArrayObjectsStateName];
}

#pragma mark -
#pragma mark Public Methods

- (BOOL)containsObject:(id)object {
    return [self containsObject:object];
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.arrayObjects objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.arrayObjects[index];
}

- (NSUInteger)indexOfObject:(id)object {
    return [self.arrayObjects indexOfObject:object];
}

- (void)addObject:(id)object {
    [self.arrayObjects addObject:object];
    
    AKStateModel *stateModel = [AKStateModel new];
    stateModel.state = kAKObjectAddedState;
    stateModel.index = self.arrayObjects.count - 1;
    [self setState:kAKArrayModelChangedState withObject:stateModel];
}

- (void)removeObject:(id)object {
    [self.arrayObjects removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.arrayObjects removeObjectAtIndex:index];
    
    AKStateModel *stateModel = [AKStateModel new];
    stateModel.state = kAKObjectRemovedState;
    stateModel.index = index;
    [self setState:kAKArrayModelChangedState withObject:stateModel];

}

- (void)removeAllObject {
    [self.arrayObjects removeAllObjects];
}

- (void)exchangeObjectAtIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    [self.arrayObjects exchangeObjectAtIndex:sourceIndex
                           withObjectAtIndex:destinationIndex];
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
        AKArrayModel *model = self.isCached
                                    ? [NSKeyedUnarchiver unarchiveObjectWithFile:self.path]
                                    : [AKArrayModel arrayModelWithObjects:[AKStringModel randomStringsModel]];
        
        strongSelf.arrayObjects = model.arrayObjects;
        
        AKDispatchAsyncOnMainThread(^ {
            strongSelf.state = kAKArrayModelLoadedState;
        });
    });
    
}

- (void)saveArrayModel {
    [NSKeyedArchiver archiveRootObject:self toFile:self.path];
}

#pragma mark -
#pragma mark NSFastEnumeration Protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(__unsafe_unretained id [])buffer
                                    count:(NSUInteger)len
{
    return [self.arrayObjects countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.arrayObjects forKey:kAKArrayObjectsKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        self.arrayObjects = [aDecoder decodeObjectForKey:kAKArrayObjectsKey];
    }
    
    return self;
}

@end
