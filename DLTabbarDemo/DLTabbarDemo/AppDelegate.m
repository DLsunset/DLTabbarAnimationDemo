//
//  AppDelegate.m
//  DLTabbarDemo
//
//  Created by 董雷 on 2019/11/26.
//  Copyright © 2019 董雷. All rights reserved.
//

#import "AppDelegate.h"
#import "DLTabViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = [[DLTabViewController alloc] init];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    return YES;
}





@end
