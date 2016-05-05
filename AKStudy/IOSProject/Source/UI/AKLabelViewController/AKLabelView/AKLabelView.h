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
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIView  *subView;

@property (nonatomic, retain) IBOutlet UISwitch *animationSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *infiniteSwitch;

@property (nonatomic, retain) IBOutlet UIButton *movingButton;

- (void)moveLabelAnimated:(BOOL)animated;

@end
