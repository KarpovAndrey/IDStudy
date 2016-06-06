//
//  AKLoginViewController.m
//  FBProject
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "AKLoginViewController.h"
#import "AKLoginView.h"
#import "AKFriendsViewController.h"

@interface AKLoginViewController () <FBSDKLoginButtonDelegate>
@property (nonatomic, strong) AKLoginView *rootView;

@end

@implementation AKLoginViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark FBSDKLoginButtonDelegate

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error
{
    [self.navigationController pushViewController:[AKFriendsViewController new] animated:YES];
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

@end
