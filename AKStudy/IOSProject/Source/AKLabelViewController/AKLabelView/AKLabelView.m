//
//  AKLabelView.m
//  AKStudy
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKLabelView.h"

static const CGFloat squareSideLength = 80;
static const CGRect upperLeftLocation  =    { { 20.0f, 40.0f }, {squareSideLength, squareSideLength} };
static const CGRect upperRightLocation =    { { 220.0f, 40.0f }, {squareSideLength, squareSideLength} };
static const CGRect lowerRightLocation =    { { 220.0f, 380.0f }, {squareSideLength, squareSideLength} };
static const CGRect lowerLeftLocation  =    { { 20.0f, 380.0f }, {squareSideLength, squareSideLength} };

@interface AKLabelView ()
@property (nonatomic, assign) NSUInteger squarePosition;

- (void)labelLocation:(NSUInteger)location;

@end

@implementation AKLabelView

#pragma mark -
#pragma mark Public

- (void)moveLabel {
    [self labelLocation:self.squarePosition];
}

- (void)animateLabel {
    [UIView animateWithDuration:0.8
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self moveLabel];
                     } completion:^(BOOL finished){
                     }];
}

#pragma mark -
#pragma mark Private

- (void)labelLocation:(NSUInteger)location {
    switch (location) {
        case kAKLabelUpperLeftLocation:
            self.label.frame = upperRightLocation;
            self.squarePosition = kAKLabelUpperRightLocation;
            break;
            
        case kAKLabelUpperRightLocation:
            self.label.frame = lowerRightLocation;
            self.squarePosition = kAKLabelLowerRightLocation;
            break;
            
        case kAKLabelLowerRightLocation:
            self.label.frame = lowerLeftLocation;
            self.squarePosition = kAKLabelLowerLeftLocation;
            break;
            
        case kAKLabelLowerLeftLocation:
            self.label.frame = upperLeftLocation;
            self.squarePosition = kAKLabelUpperLeftLocation;
            break;
    }
}

@end
