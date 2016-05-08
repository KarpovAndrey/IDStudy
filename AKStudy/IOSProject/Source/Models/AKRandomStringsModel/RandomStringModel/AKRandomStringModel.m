//
//  AKRandomStringModel.m
//  AKStudy
//
//  Created by Admin on 08.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKRandomStringModel.h"

@interface AKRandomStringModel ()
@property (nonatomic, copy) NSString *randomString;

@end

@implementation AKRandomStringModel

#pragma mark -
#pragma mark Ininializations & Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.randomString = [NSMutableString randomString];
    }
    
    return self;
}

@end
