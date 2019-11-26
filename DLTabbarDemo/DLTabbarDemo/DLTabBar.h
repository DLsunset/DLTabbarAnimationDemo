//
//  DLTabBar.h
//  DLTabbarAnimation
//
//  Created by 董雷 on 2019/8/9.
//  Copyright © 2019 董雷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLLottieView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DLTabBar : UITabBar

@property (nonatomic, copy) NSArray <DLLottieView *>*itemArr;
@property (nonatomic, assign) NSInteger biggerItemIndex;

- (void)playAnimationForIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
