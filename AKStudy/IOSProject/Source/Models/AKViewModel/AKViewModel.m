//
//  AKViewModel.m
//  AKStudy
//
//  Created by Admin on 19.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKViewModel.h"
#import "AKLoadingView.h"

@interface AKViewModel ()
@property (nonatomic, strong) AKLoadingView *loadingView;

@end

@implementation AKViewModel

- (void)showLoading {
    self.loadingView = [UINib loadFromNibWithClass:[AKLoadingView class]];
    [self addSubview:self.loadingView];
}

- (void)removeLoading {
    [self.loadingView removeFromSuperview];
}

@end
