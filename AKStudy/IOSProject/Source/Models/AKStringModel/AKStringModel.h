//
//  AKStringModel.h
//  AKStudy
//
//  Created by Admin on 08.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKStringModel : NSObject
@property (nonatomic, readonly) NSString *string;

+ (NSArray *)randomStringsModel;

- (instancetype)initWithString:(NSString *)string;

@end
