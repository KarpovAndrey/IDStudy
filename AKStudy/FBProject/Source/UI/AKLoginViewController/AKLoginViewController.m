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

@interface AKLoginViewController ()
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
#pragma mark Handling Interrface

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self.navigationController pushViewController:[AKFriendsViewController new] animated:YES];
         }
     }];
}

@end
