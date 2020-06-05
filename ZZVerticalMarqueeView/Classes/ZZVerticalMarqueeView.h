//
//  ZZVerticalMarqueeView.h
//  ZZVerticalMarqueeViewDemo
//
//  Created by Friday on 2020/6/5.
//  Copyright © 2020 STARK INDUSTRY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZVerticalMarqueeView : UIView

/** 标题的字体 默认为14 */
@property(nonatomic)UIFont *titleFont;
/**标题的颜色 默认黑色*/
@property(nonatomic)UIColor *titleColor;
/**存放titles的数组 和初始化的数组一致*/
@property(nonatomic)NSArray *titleArr;
/**滚动间隔时间*/
@property(nonatomic, assign) NSTimeInterval scrollTimeInterval;

//回调
@property(nonatomic, copy) void(^handlerTitleClickCallBack)(NSInteger index);

#pragma mark - init Methods
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSArray *)titles;
#pragma mark - Operation Methods
- (void)start;
- (void)stop;
- (void)resume;

@end

NS_ASSUME_NONNULL_END
