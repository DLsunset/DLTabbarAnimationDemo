//
//  DLTabBar.m
//  DLTabbarAnimation
//
//  Created by 董雷 on 2019/8/9.
//  Copyright © 2019 董雷. All rights reserved.
//

#import "DLTabBar.h"
#import <objc/runtime.h>
#import <Masonry.h>
@interface DLTabBar()<UITabBarDelegate>

@property (nonatomic, assign) BOOL needSetBiggerItem;

@end

@implementation DLTabBar

- (void)setBiggerItemIndex:(NSInteger)biggerItemIndex {
    _biggerItemIndex = biggerItemIndex;
    _needSetBiggerItem = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DLLottieView *view = [DLLottieView animationWithSelectName:@"arrow_select" unselectName:@"arrow_unselect"];
        DLLottieView *view1 = [DLLottieView animationWithSelectName:@"second_select" unselectName:@"second_unselect"];
        DLLottieView *view2 = [DLLottieView animationWithSelectName:@"arrow_select" unselectName:@"arrow_unselect"];

        self.itemArr = @[view,view1,view2];

        NSInteger flag = 0;
        for (UIView *barBtn in self.subviews) {
            if ([barBtn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                UIImageView *tabBarSwappableImageView = [[UIImageView alloc] init];;
                for (UIView *subView in barBtn.subviews) {
                    if ([subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                        tabBarSwappableImageView = (UIImageView *)subView;
                    }
                }
                [tabBarSwappableImageView addSubview:self->_itemArr[flag]];

                CGFloat width = self->_needSetBiggerItem && flag == self->_biggerItemIndex ? 52 : 32;
                CGFloat y = self->_needSetBiggerItem && flag == self->_biggerItemIndex ? 10 : 0;

                self->_itemArr[flag].frame = CGRectMake(0, 0, width, width);
                self->_itemArr[flag].center = CGPointMake(tabBarSwappableImageView.center.x, tabBarSwappableImageView.center.y - y);
                flag ++;

            }
        }
        [self playAnimationForIndex:0];
    });
}

- (void)playAnimationForIndex:(NSInteger)index {
    
    for (DLLottieView *view in self.itemArr) {
        view.selected = NO;
    }
    self.itemArr[index].selected = YES;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) { // 当前界面 tabBar显示
        UIView *biggerView = self.itemArr[_biggerItemIndex];
        CGPoint newPoint = [self convertPoint:point toView:biggerView];

        if ( [biggerView pointInside:newPoint withEvent:event]) { // 点 属于按钮范围
            return [[biggerView superview] superview];  //交给它所属的UITabBarButton来处理
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

@end
