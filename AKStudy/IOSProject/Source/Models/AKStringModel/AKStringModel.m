//
//  AKRandomStringModel.m
//  AKStudy
//
//  Created by Admin on 08.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKStringModel.h"
#import "AKDispatch.h"

static NSUInteger const kAKDefaultStringCount   = 40;
static NSString * const kAKImagePath            = @"Duck.jpg";
static NSString * const kAKStringKey            = @"string";

@interface AKStringModel ()
@property (nonatomic, copy)     NSString    *string;
@property (nonatomic, strong)   UIImage     *image;

@end

@implementation AKStringModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)randomStringModel {
    return [[self class] new];
}

+ (instancetype)stringModelWirhString:(NSString *)string {
    return [[[self class] alloc] initWithString:string];
}

+ (NSArray *)randomStringsModel {
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSUInteger index = 0; index < arc4random_uniform(kAKDefaultStringCount) + 1; index++) {
        [mutableArray addObject:[self randomStringModel]];
    }

    return [mutableArray copy];
}

#pragma mark -
#pragma mark Ininializations & Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.string = [NSString randomString];
    }
    
    return self;
}

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.string = [string copy];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)prepareToLoading {
    self.image = [UIImage imageWithContentsOfFile:[NSBundle pathToFileWithName:kAKImagePath]];
}

- (void)finishLoading {
    [self setState:kAKModelLoadedState withObject:self.image];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.string forKey:kAKStringKey];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (self) {
        self.string = [aDecoder decodeObjectForKey:kAKStringKey];
    }
    
    return self;
}

@end
