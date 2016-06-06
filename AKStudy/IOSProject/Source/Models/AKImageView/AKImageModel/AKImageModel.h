//
//  AKImageModel.h
//  AKStudy
//
//  Created by Admin on 25.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKImageView.h"
#import "AKModel.h"

@interface AKImageModel : AKModel
@property (nonatomic, strong) UIImage        *image;
@property (nonatomic, strong) NSURL          *URL;

@end
