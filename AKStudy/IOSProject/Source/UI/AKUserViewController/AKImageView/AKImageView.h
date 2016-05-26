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
@property (nonatomic, strong) AKImageModel      *model;
@property (nonatomic, strong) NSString          *url;

@end
