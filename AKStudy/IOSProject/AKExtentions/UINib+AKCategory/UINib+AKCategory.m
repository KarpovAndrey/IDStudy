//
//  UINib+AKCategory.m
//  AKStudy
//
//  Created by Admin on 09.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UINib+AKCategory.h"

@implementation UINib (AKCategory)

+ (id)loadFromNibWithClass:(Class)theClass {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(theClass) bundle:[NSBundle mainBundle]];
    NSArray *objects = [nib instantiateWithOwner:self options:nil];
    for (id classObject in objects) {
        if ([classObject isMemberOfClass:[theClass class]]) {
            return classObject;
        }
    }
    
    return nil;
}

@end