//
//  AKUserViewController.h
//  AKStudy
//
//  Created by Admin on 04.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKArrayModel;
@class AKArrayManager;

@interface AKUserViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) AKArrayModel *arrayModel;

- (IBAction)onEditingSwitch:(id)sender;

@end
