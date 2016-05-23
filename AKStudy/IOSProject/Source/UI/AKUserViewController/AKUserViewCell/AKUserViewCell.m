//
//  AKUserViewCell.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUserViewCell.h"
#import "AKStringModel.h"

@interface AKUserViewCell ()
@property (nonatomic, strong) AKStringModel *model;

- (void)load;

@end

@implementation AKUserViewCell

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AKStringModel *)model {
    if (_model != model) {
        _model = model;
        
        self.cellLabel.text = model.string;
        self.cellImage.image = nil;
        
        AKWeakify(AKUserViewCell);
        [_model addHandler:^(UIImage *image){
            AKStrongifyAndReturnIfNil(AKUserViewCell);
            strongSelf.cellImage.image = image;
            
            UIActivityIndicatorView *activityIndicator = strongSelf.activityIndicator;
            [activityIndicator stopAnimating];
            activityIndicator.hidden = YES;
        } forState:kAKStringModelLoadedState
                    object:self];
        
        [self load];
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    [self.model load];
    [self.activityIndicator startAnimating];
}

- (void)fillWithModel:(AKStringModel *)theModel {
    self.cellImage.image = nil;
    self.model = theModel;
}

@end
