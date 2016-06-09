//
//  AKUser.h
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKUser : NSObject
@property (nonatomic, copy) NSString    *name;
@property (nonatomic, copy) NSString    *surname;
@property (nonatomic, copy) NSString    *userID;

+ (instancetype)userWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithUserID:(NSString *)userID;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
