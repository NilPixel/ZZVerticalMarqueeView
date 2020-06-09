//
//  ZZVerticalMarqueeView.m
//  ZZVerticalMarqueeViewDemo
//
//  Created by Friday on 2020/6/5.
//  Copyright © 2020 STARK INDUSTRY. All rights reserved.
//

#import "ZZVerticalMarqueeView.h"
#import "UIView+Extension.h"
#import "Masonry.h"
#import "TimerProxy.h"

@interface ZZVerticalMarqueeView ()

@property(assign, nonatomic)NSInteger titleIndex;
/**第一个*/
@property(nonatomic)UIButton *firstBtn;
/**更多个*/
@property(nonatomic)UIButton *moreBtn;

@property(nonatomic, strong)NSTimer *timer;

@end

@implementation ZZVerticalMarqueeView

#pragma mark - init Methods
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSArray *)titles{
    if (self = [super initWithFrame:frame]) {
        _titleArr  = titles;
        self.clipsToBounds = YES;
        self.titleColor = [UIColor blackColor];

        self.firstBtn = [self btnframe:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)  titleColor:_titleColor action:@selector(clickBtn:)];
        [self addSubview:self.firstBtn];
        
        self.moreBtn = [self btnframe: CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height) titleColor:_titleColor action:@selector(clickBtn:)];
        [self addSubview:self.moreBtn];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = YES;
    self.titleColor = [UIColor blackColor];
    self.firstBtn = [self btnframe:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)  titleColor:_titleColor action:@selector(clickBtn:)];
    [self addSubview:self.firstBtn];
    [self.firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.width.height.equalTo(self);
    }];

    self.moreBtn = [self btnframe: CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height) titleColor:_titleColor action:@selector(clickBtn:)];
    [self addSubview:self.moreBtn];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_bottom);
        make.left.width.height.equalTo(self);
    }];
}

#pragma mark - SEL Methods
- (void)nextAd {
    if (self.titleArr.count <= 0) {
        [self invalidateTimer];
        return;
    }
    
    if (self.titleIndex == self.titleArr.count - 1) {
        self.titleIndex = -1;
    }
    
    [self.moreBtn setTitle:self.titleArr[self.titleIndex + 1] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.55 animations:^{
        self.firstBtn.y = -self.bounds.size.height;
        self.moreBtn.y = 0;
    } completion:^(BOOL finished) {
        UIButton *tmp = self.moreBtn;
        self.moreBtn = self.firstBtn;
        self.firstBtn = tmp;
        self.moreBtn.y = self.bounds.size.height;
    }];
    self.titleIndex++;
}

- (void)clickBtn:(UIButton *)btn {
    if (self.handlerTitleClickCallBack && self.titleArr.count > 0) {
        self.handlerTitleClickCallBack(_titleIndex);
    }
}

#pragma mark - Custom Methods
- (UIButton *)btnframe:(CGRect)frame titleColor:(UIColor *)titleColor action:(SEL)action{
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = frame;
    btn.titleLabel.font = _titleFont;
      //靠左 不居中显示
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;////文字多出部分 在右侧显示点点
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

#pragma mark - Setter && Getter Methods

- (void)invalidateTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        self.titleIndex = 0;
    }
}

- (void)setTitleArr:(NSArray *)titleArr {
    [self stop];
    self.titleIndex = 0;
    _titleArr = titleArr;
    if (_titleArr.count > 0) {
        [self.firstBtn setTitle:_titleArr.firstObject forState:UIControlStateNormal];
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self.firstBtn setTitleColor:_titleColor forState:UIControlStateNormal];
    [self.moreBtn setTitleColor:_titleColor forState:UIControlStateNormal];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.firstBtn.titleLabel.font = _titleFont;
    self.moreBtn.titleLabel.font = _titleFont;
}

- (void)start {
    [self invalidateTimer];
    TimerProxy *proxy=[[TimerProxy alloc]initWithTarget: self];
    if (_scrollTimeInterval == 0) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:proxy selector:@selector(nextAd) userInfo:nil repeats:YES];
    } else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:_scrollTimeInterval target:proxy selector:@selector(nextAd) userInfo:nil repeats:YES];
    }
}

- (void)stop {
    if (self.timer) {
        [self.timer invalidate];
    }
}

- (void)resume {
    if (self.timer) {
        [self.timer fire];
    }
}

- (void)dealloc {
    [self invalidateTimer];
    NSLog(@"timer销毁了");
}

@end
