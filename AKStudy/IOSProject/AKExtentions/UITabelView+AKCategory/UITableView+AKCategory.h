//
//  UITableView+AKCategory.h
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AKCategory)

- (id)dequeueReusableCellWithIdentifierWithClass:(Class)theClass;
- (id)dequeueCellFromNibWithClass:(Class)theClass;

@end
