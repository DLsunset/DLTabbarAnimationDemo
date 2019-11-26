//
//  DLLottieView.h
//  DLTabbarAnimation
//
//  Created by 董雷 on 2019/8/9.
//  Copyright © 2019 董雷. All rights reserved.
//

#import "LOTAnimationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLLottieView : LOTAnimationView


@property (nonatomic, assign) BOOL selected;

@property (nonatomic, copy) NSString *unselectJson;
@property (nonatomic, copy) NSString *selectJson;

+ (instancetype)animationWithSelectName:(NSString *)selectName unselectName:(NSString *)unselectName;

@end

NS_ASSUME_NONNULL_END
