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
static NSString * const kAKImageURLString       = @"http://mirgif.com/humor/prikol104.jpg";

@interface AKStringModel ()
@property (nonatomic, copy)     NSString        *string;

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
    self = [self init];
    if (self) {
        self.string = [string copy];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)urlString {
    return kAKImageURLString;
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
