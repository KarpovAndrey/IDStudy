//
//  UITableView+AKCategory.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UITableView+AKCategory.h"
#import "UINib+AKCategory.h"

@implementation UITableView (AKCategory)

- (id)dequeueReusableCellWithIdentifierWithClass:(Class)theClass {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(theClass)];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:NSStringFromClass(theClass)];
    }
    
    return cell;
}

- (id)dequeueCellFromNibWithClass:(Class)theClass {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(theClass)];
    if (cell == nil) {
        cell = [UINib loadFromNibWithClass:theClass];
    }
    
    return cell;
}

@end
