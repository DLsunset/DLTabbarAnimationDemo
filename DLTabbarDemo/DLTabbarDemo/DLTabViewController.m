//
//  DLTabViewController.m
//  DLTabbarAnimation
//
//  Created by 董雷 on 2019/8/9.
//  Copyright © 2019 董雷. All rights reserved.
//

#import "DLTabViewController.h"
#import "DLTabBar.h"
#import "ViewController.h"
@interface DLTabViewController ()

@end

@implementation DLTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DLTabBar *tabBar = [[DLTabBar alloc] init];
    tabBar.biggerItemIndex = 1;
    [self setValue:tabBar forKey:@"tabBar"];
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor]; normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    ViewController *vc1 = [[ViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    vc1.tabBarItem.title = @"first";
    vc1.tabBarItem.image = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.selectedImage = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIViewController *vc2 = [[UIViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    vc2.tabBarItem.title = @"second";
    vc2.tabBarItem.image = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.selectedImage = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    vc3.tabBarItem.title = @"third";
    vc3.tabBarItem.image = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc3.tabBarItem.selectedImage = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.viewControllers = @[nav1, nav2, nav3];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    DLTabBar *tab = (DLTabBar *)tabBar;
    [tab playAnimationForIndex:[tabBar.items indexOfObject:item]];
}


@end
