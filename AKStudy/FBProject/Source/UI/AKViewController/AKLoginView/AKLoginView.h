//
//  AKLoginView.h
//  AKStudy
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FBSDKLoginButton;

@interface AKLoginView : UIView
@property (nonatomic, strong) IBOutlet FBSDKLoginButton *loginButton;

@end
