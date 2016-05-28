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

@interface AKUserViewCell ()
@property (nonatomic, strong) AKStringModel *stringModel;
@end

@implementation AKUserViewCell

#pragma mark -
#pragma mark Accessors

- (void)setStringModel:(AKStringModel *)stringModel {
    if (_stringModel != stringModel) {
        _stringModel = stringModel;
    }
    
    self.cellLabel.text = stringModel.string;
    self.customImageView.URL = [NSURL URLWithString:stringModel.urlString];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AKStringModel *)theModel {
    self.stringModel = theModel;
}

@end
