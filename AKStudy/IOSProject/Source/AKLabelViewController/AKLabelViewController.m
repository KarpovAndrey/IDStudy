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

- (IBAction)onClickGoButton:(id)sender {
    [self.rootView moveLabelAnimated:NO];
}

- (IBAction)onAnimatedSwitch:(id)sender {

}

- (IBAction)onStepsSwitch:(id)sender {
    
}

@end