//
//  UITableView+AKCategory.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UITableView+AKCategory.h"

@implementation UITableView (AKCategory)

- (id)dequeueReusableCellWithIdentifierWithClass:(Class)theClass {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(theClass)];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:NSStringFromClass(theClass)];
    }
    
    return cell;
}


//AKUserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AKUserViewCell class])];
//
//if (!cell) {
//    UINib *nib = [UINib nibWithNibName:NSStringFromClass([AKUserViewCell class]) bundle:[NSBundle mainBundle]];
//    cell = [[nib instantiateWithOwner:[AKUserViewCell class] options:nil] firstObject];
//}
@end