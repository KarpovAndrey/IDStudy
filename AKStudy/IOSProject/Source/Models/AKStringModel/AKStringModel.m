//
//  AKRandomStringModel.m
//  AKStudy
//
//  Created by Admin on 08.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKStringModel.h"

static const NSUInteger kAKDefaultStringCount = 40;

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
        self.image = [UIImage imageNamed:@"Duck"];
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

@end
