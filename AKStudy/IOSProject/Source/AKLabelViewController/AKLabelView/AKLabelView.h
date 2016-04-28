//
//  AKLabelView.h
//  AKStudy
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum AKLabelLocation : NSUInteger {
    kAKLabelUpperLeftLocation,
    kAKLabelUpperRightLocation,
    kAKLabelLowerRightLocation,
    kAKLabelLowerLeftLocation
} AKLabelLocation;

@interface AKLabelView : UIView
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UIView  *subView;

@property (nonatomic, retain) IBOutlet UISwitch *animationSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *stepsSwitch;

- (void)moveLabelAnimated:(BOOL)animated;

@end
