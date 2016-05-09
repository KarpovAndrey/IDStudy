//
//  AKUserViewCell.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUserViewCell.h"
#import "AKStringModel.h"

@implementation AKUserViewCell

- (void)fillWithModel:(AKStringModel *)theModel {
    self.cellLabel.text = theModel.string;
}

@end
