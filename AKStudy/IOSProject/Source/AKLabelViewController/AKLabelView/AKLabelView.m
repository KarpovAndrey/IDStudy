//
//  AKLabelView.m
//  AKStudy
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKLabelView.h"

typedef void (^AKLabelHandler)(void);
static const NSUInteger kAKDefaultAnimateDuretion = 1;

@interface AKLabelView ()
@property (nonatomic, assign) NSUInteger squarePosition;

- (AKLabelLocation)nextPosition;
- (CGRect)frameForPosition:(NSUInteger)position;

@end

@implementation AKLabelView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(NSUInteger)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(NSUInteger)squarePosition animated:(BOOL)animated {
    if (_squarePosition != squarePosition) {
        [self setSquarePosition:squarePosition animated:animated completionHandler:^{
            _squarePosition = squarePosition;
        }];
    }
}

- (void)setSquarePosition:(NSUInteger)squarePosition
                 animated:(BOOL)animated
        completionHandler:(AKLabelHandler)handler
{
    [UIView animateWithDuration:animated ? kAKDefaultAnimateDuretion : 0
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.label.frame = [self frameForPosition:squarePosition];
                     } completion:^(BOOL finished){
                         if (handler) {
                             handler();
                         }
                         if (self.stepsSwitch.on) {
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

- (CGRect)frameForPosition:(NSUInteger)position {
    CGSize subViewSize = self.subView.frame.size;
    CGSize labelSize = self.label.frame.size;
    
    CGFloat xUpperPosition = subViewSize.width - labelSize.width;
    CGFloat yLowerPosition = subViewSize.height - labelSize.height;
    switch (position) {
        case kAKLabelUpperLeftLocation:
            return CGRectMake(0, 0, labelSize.width, labelSize.height);
            
        case kAKLabelUpperRightLocation:
            return CGRectMake(xUpperPosition, 0, labelSize.width, labelSize.height);
            
        case kAKLabelLowerRightLocation:
            return CGRectMake(xUpperPosition, yLowerPosition,
                              labelSize.width, labelSize.height);
        
        default:
            return CGRectMake(0, yLowerPosition,
                              labelSize.width, labelSize.height);
    }
}
@end
