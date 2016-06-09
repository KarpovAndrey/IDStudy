//
//  AKFriendsContext.m
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKFriendsContext.h"
#import "AKUser.h"

@interface AKFriendsContext ()
@property (nonatomic, copy) NSString *userID;

@end

@implementation AKFriendsContext

#pragma mark -
#pragma mark Initialization & Deallocation

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
    }
    
    return self;
}


#pragma mark -
#pragma mark Public

- (void)setupLoad {
    NSString *path = [NSString stringWithFormat:@"/%@", self.userID];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:path
                                  parameters:@{@"fields": @"friends{location,gender,picture,birthday}",}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        NSArray *friends = [result valueForKeyPath:@"friends.data"];
        NSMutableArray *friendsArray = [NSMutableArray array];
        [self setState:kAKModelLoadedState withObject:[friendsArray copy]];
        NSLog(@"%@", friends);
    }];
}

@end
