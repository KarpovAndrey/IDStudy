//
//  NSFileManager+AKCategory.m
//  AKStudy
//
//  Created by Admin on 19.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "NSFileManager+AKCategory.h"

@implementation NSFileManager (AKCategory)

+ (NSString *)pathToDocumentDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths firstObject];
    
    return documentDirectory;
}

+ (NSString *)pathToFileWithName:(NSString *)fileName {
    return [[self pathToDocumentDirectory] stringByAppendingPathComponent:fileName];
}

@end
