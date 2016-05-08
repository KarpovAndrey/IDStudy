//
//  AKStringModel.h
//  AKStudy
//
//  Created by Admin on 07.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKStringsModel : NSObject
@property (nonatomic, strong) NSMutableArray *stringsModels;

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (NSString *)stringFromObjectAtIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;

@end
