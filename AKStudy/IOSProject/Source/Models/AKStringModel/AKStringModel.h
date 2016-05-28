//
//  AKStringModel.h
//  AKStudy
//
//  Created by Admin on 08.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKModel.h"

@interface AKStringModel : AKModel <NSCoding>
@property (nonatomic, readonly) NSString    *string;
@property (nonatomic, readonly) NSString    *urlString;

+ (NSArray *)randomStringsModel;

- (instancetype)initWithString:(NSString *)string;

@end
