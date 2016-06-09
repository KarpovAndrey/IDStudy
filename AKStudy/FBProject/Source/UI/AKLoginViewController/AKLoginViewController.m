//
//  AKLoginViewController.m
//  FBProject
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKLoginViewController.h"
#import "AKLoginView.h"
#import "AKFriendsViewController.h"
#import "AKUser.h"

#define kAKFacebookPermissions @[@"public_profile", @"user_friends"]

@interface AKLoginViewController ()
@property (nonatomic, strong) AKLoginView    *rootView;
@property (nonatomic, strong) AKUser         *user;

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
#pragma mark Accessors

- (void)setUser:(AKUser *)user {
    if (_user != user) {
        _user = user;
        
        AKFriendsViewController * controller = [AKFriendsViewController new];
        controller.user = _user;
        [self.navigationController pushViewController:controller animated:NO];
    }
}

#pragma mark -
#pragma mark Handling Interrface

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];

    [login
     logInWithReadPermissions:kAKFacebookPermissions
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (!error && !result.isCancelled) {
             NSLog(@"Logged in");
             self.user = [[AKUser alloc] initWithUserID:result.token.userID];
         } else {
             NSLog(@"Not logged in");
         }
     }];
}

@end
