//
//  AKImageView.h
//  AKStudy
//
//  Created by Admin on 26.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKImageModel;

@interface AKImageView : UIView
@property (nonatomic, strong) AKImageModel      *imageModel;
@property (nonatomic, strong) NSURL             *URL;

- (void)dump;

@end
