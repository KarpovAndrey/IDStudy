//
//  AKSharedCacheModel.h
//  AKStudy
//
//  Created by Admin on 02.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKSharedCacheModel : NSObject <NSCoding>

+ (instancetype)sharedCache;

- (NSString *)keyForValue:(NSString *)value;
- (BOOL)isCahedForKey:(NSString *)key;
- (void)addValueForKey:(NSString *)key;
- (void)removeValueForKey:(NSString *)key;

@end
