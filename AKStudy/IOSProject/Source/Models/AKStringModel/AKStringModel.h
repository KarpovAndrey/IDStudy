//
//  AKStringModel.h
//  AKStudy
//
//  Created by Admin on 08.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKObserver.h"

typedef NS_ENUM(NSUInteger, AKStringModelState) {
    kAKStringModelUndefinedState,
    kAKStringModelLoadingState,
    kAKStringModelChangedState,
    kAKStringModelLoadedState
};

@interface AKStringModel : AKObserver <NSCoding>
@property (nonatomic, readonly) NSString *string;
@property (nonatomic, readonly) UIImage  *image;

+ (NSArray *)randomStringsModel;

- (instancetype)initWithString:(NSString *)string;

- (void)load;

@end
