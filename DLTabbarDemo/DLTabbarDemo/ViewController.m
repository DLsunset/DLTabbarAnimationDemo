//
//  ViewController.m
//  DLTabbarDemo
//
//  Created by 董雷 on 2019/11/26.
//  Copyright © 2019 董雷. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor blueColor];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"四代"]];
    [scroll addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.width.offset(600);
        make.height.offset(700);
    }];
}


@end
