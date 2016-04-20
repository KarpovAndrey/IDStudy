//
//  AKLabelView.m
//  AKStudy
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKLabelView.h"

@implementation AKLabelView

#pragma mark -
#pragma mark Public

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.label.text = @"TEXT";
}

@end
