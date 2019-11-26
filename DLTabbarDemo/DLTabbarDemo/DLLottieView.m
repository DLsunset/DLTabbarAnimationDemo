//
//  DLLottieView.m
//  DLTabbarAnimation
//
//  Created by 董雷 on 2019/8/9.
//  Copyright © 2019 董雷. All rights reserved.
//

#import "DLLottieView.h"

@implementation DLLottieView

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    if (selected == NO) {
        self.animation = _unselectJson;
        self.animationProgress = 1;
    }else {
        self.animation = _selectJson;
        self.animationSpeed = 2;
        [self play];
    }
}

+ (instancetype)animationWithSelectName:(NSString *)selectName unselectName:(NSString *)unselectName {
    
    DLLottieView *view = [[DLLottieView alloc] init];
    view.selectJson = selectName;
    view.unselectJson = unselectName;
    return view;
    
}

@end
