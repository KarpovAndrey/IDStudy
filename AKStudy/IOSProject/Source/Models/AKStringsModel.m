//
//  AKStringModel.m
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKStringModel.h"

@implementation AKStringModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.strings = [NSString randomStrings];
    }
    
    return self;
}

@end
