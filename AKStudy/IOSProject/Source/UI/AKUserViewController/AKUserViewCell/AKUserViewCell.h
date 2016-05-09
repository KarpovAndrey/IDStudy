//
//  AKUserViewCell.h
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKStringModel;

@interface AKUserViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel      *cellLabel;
@property (nonatomic, strong) IBOutlet UIImageView  *cellImage;

- (void)fillWithModel:(AKStringModel *)theModel;

@end
