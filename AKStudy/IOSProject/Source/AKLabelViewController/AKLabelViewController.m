//
//  AKLabelViewController.m
//  AKStudy
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKLabelViewController.h"
#import "AKLabelView.h"

@interface AKLabelViewController ()
@property (nonatomic, readonly) AKLabelView *rootView;

@end

@implementation AKLabelViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKLabelView);

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickAnimationsButton:(id)sender {
    [self.rootView animateLabel];
}

- (IBAction)onClickStepsButton:(id)sender {
    [self.rootView moveLabel];
}

@end