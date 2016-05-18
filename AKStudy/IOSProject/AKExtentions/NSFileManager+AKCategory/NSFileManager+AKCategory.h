//
//  NSFileManager+AKCategory.h
//  AKStudy
//
//  Created by Admin on 19.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (AKCategory)

+ (NSString *)pathToDocumentDirectory;
+ (NSString *)pathToFileWithName:(NSString *)fileName;

@end
