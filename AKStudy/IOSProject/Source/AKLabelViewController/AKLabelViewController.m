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
@property (nonatomic, strong) AKLabelView *rootView;

@end

@implementation AKLabelViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKLabelView);

#pragma mark -
#pragma mark Handling Interface

- (IBAction)onClickmovingButton:(id)sender {
    AKLabelView *view = self.rootView;
    [view moveLabelAnimated:view.animationSwitch.on ? YES : NO];
    if (view.infiniteSwitch.on) {
        view.movingButton.enabled = NO;
    }
}

- (IBAction)onAnimatedSwitch:(id)sender {
    
}

- (IBAction)onInfiniteSwitch:(id)sender {
    AKLabelView *view = self.rootView;
    if (!view.infiniteSwitch.on) {
        view.movingButton.enabled = YES;
    }
}

@end