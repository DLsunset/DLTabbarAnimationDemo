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
    
    //让tabbar有半透明高斯模糊的效果
    tabBar.backgroundColor = [UIColor clearColor];
    
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
    //这里添加空image，是因为如果不加image，那tabbarItem不会有UIImageView的子控件
    vc1.tabBarItem.image = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.selectedImage = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIViewController *vc2 = [[UIViewController alloc] init];
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
    image.frame = vc2.view.bounds;
    [vc2.view addSubview:image];
    
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    vc2.tabBarItem.title = @"second";
    vc2.tabBarItem.image = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.selectedImage = [[[UIImage alloc] init] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image2"]];
    image1.frame = vc3.view.bounds;
    [vc3.view addSubview:image1];
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
