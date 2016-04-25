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

- (void)moveLabel;
- (void)animateLabel;

@end
