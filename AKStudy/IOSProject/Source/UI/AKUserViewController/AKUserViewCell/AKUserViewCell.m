//
//  AKUserViewCell.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUserViewCell.h"
#import "AKStringModel.h"
#import "AKImageView.h"

@implementation AKUserViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AKStringModel *)theModel {
    self.cellLabel.text = theModel.string;
    self.customImageView.URL = [NSURL URLWithString:theModel.urlString];
}

@end
