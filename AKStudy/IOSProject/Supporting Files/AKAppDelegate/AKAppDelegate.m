//
//  AKAppDelegate.m
//  IOSProject
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKAppDelegate.h"
#import "AKLabelViewController.h"
#import "AKUserViewController.h"
#import "AKArrayModel.h"
#import "AKStringModel.h"

@interface AKAppDelegate ()

@end

@implementation AKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    AKUserViewController *viewController = [AKUserViewController defaultControllerFromNib];
    
    viewController.arrayModel = [AKArrayModel arrayModelWithObjects:[AKStringModel randomStringsModel]];
//    viewController.stringsModel = [AKArrayModel new];
    window.rootViewController = viewController;
    
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end