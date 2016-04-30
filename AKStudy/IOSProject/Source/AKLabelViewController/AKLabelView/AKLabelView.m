//
//  AKLabelView.m
//  AKStudy
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKLabelView.h"

typedef void (^AKLabelHandler)(void);
static const NSTimeInterval kAKDefaultAnimateDuration = 0.7;
static const NSTimeInterval kAKDefaultAnimateDelay = 0.2;

@interface AKLabelView ()
@property (nonatomic, assign) AKLabelLocation squarePosition;

- (AKLabelLocation)nextPosition;
- (CGRect)frameForPosition:(AKLabelLocation)position;

@end

@implementation AKLabelView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Ball"]];
}

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(AKLabelLocation)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(AKLabelLocation)squarePosition animated:(BOOL)animated {
    if (_squarePosition != squarePosition) {
        [self setSquarePosition:squarePosition animated:animated completionHandler:^{
            _squarePosition = squarePosition;
        }];
    }
}

- (void)setSquarePosition:(AKLabelLocation)squarePosition
                 animated:(BOOL)animated
        completionHandler:(AKLabelHandler)handler
{
    [UIView animateWithDuration:animated ? kAKDefaultAnimateDuration : 0
                          delay:kAKDefaultAnimateDelay
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.label.frame = [self frameForPosition:squarePosition];
                     } completion:^(BOOL finished){
                         if (handler) {
                             handler();
                         }
                         
                         if (self.infiniteSwitch.on) {
                             [self setSquarePosition:[self nextPosition] animated:self.animationSwitch.on];
                         }
                     }];
}

#pragma mark -
#pragma mark Public

- (void)moveLabelAnimated:(BOOL)animated {    
    [self setSquarePosition:[self nextPosition] animated:animated];
}

#pragma mark -
#pragma mark Private

- (AKLabelLocation)nextPosition {
    switch (self.squarePosition) {
        case kAKLabelUpperLeftLocation:
            return kAKLabelUpperRightLocation;
            
        case kAKLabelUpperRightLocation:
            return kAKLabelLowerRightLocation;
            
        case kAKLabelLowerRightLocation:
            return kAKLabelLowerLeftLocation;
            
        default:
            return kAKLabelUpperLeftLocation;
    }
}

- (CGRect)frameForPosition:(AKLabelLocation)position {
    CGFloat x = 0;
    CGFloat y = 0;
    
    CGSize subViewSize = self.subView.frame.size;
    CGSize labelSize = self.label.frame.size;
    
    CGFloat xUpperPosition = subViewSize.width - labelSize.width;
    CGFloat yLowerPosition = subViewSize.height - labelSize.height;
    switch (position) {
        case kAKLabelUpperRightLocation:
            x = xUpperPosition;
            break;

        case kAKLabelLowerRightLocation:
            x = xUpperPosition;
            y = yLowerPosition;
            break;

        case kAKLabelLowerLeftLocation:
            y = yLowerPosition;
            break;
        
        default: kAKLabelUpperLeftLocation:
            break;
    }
    
    return CGRectMakeWithSize(x, y, labelSize);
}
@end
