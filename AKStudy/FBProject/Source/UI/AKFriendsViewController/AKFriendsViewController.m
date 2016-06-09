//
//  AKFriendsViewController.m
//  AKStudy
//
//  Created by Admin on 07.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKFriendsContext.h"
#import "AKUser.h"
#import "AKFriendsViewController.h"

@interface AKFriendsViewController ()
@property (nonatomic, strong) AKFriendsContext  *context;
@property (nonatomic, strong) NSArray           *friends;

@end

@implementation AKFriendsViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(AKUser *)user {
    if (_user != user) {
        _user = user;
        
        self.context = [[AKFriendsContext alloc] initWithUserID:_user.userID];
    }
}

- (void)setContext:(AKFriendsContext *)context {
    if (_context != context) {
        _context = context;
        
        AKWeakify;
        [_context addHandler:^(NSArray *friends) {
            AKStrongifyAndReturnIfNil(AKFriendsViewController)
            strongSelf.friends = friends;
        }forState:kAKModelLoadedState
            object:self];
        
        [_context load];
    }
}

@end
