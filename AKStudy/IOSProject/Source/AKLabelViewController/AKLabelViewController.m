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
@property (nonatomic, readonly) AKLabelView *labelView;

@end

@implementation AKLabelViewController

#pragma mark -
#pragma mark Accessors

- (AKLabelView *)labelView {
    if ([self isViewLoaded] && [self isKindOfClass:[AKLabelView class]]) {
        return (AKLabelView *)self.view;
    }
    
    return (AKLabelView *)self.view;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
//    label.text = @"OLOLO";
//    label.backgroundColor = [UIColor redColor];
//    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//    self.view.opaque = NO;
//    
//    [self.view addSubview:label];
    
//    [[(AKLabelView *) [self view] label] setText:@"New text"];
    
    self.labelView.label.text = @"New text";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
