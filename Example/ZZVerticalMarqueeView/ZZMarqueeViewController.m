//
//  ZZMarqueeViewController.m
//  ZZVerticalMarqueeView_Example
//
//  Created by Friday on 2020/6/9.
//  Copyright © 2020 NilPixel. All rights reserved.
//

#import "ZZMarqueeViewController.h"
#import "ZZVerticalMarqueeView.h"

@interface ZZMarqueeViewController ()

@property (weak, nonatomic) IBOutlet ZZVerticalMarqueeView *marqueeView;

@end

@implementation ZZMarqueeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.marqueeView.titleFont = [UIFont systemFontOfSize:15];
    self.marqueeView.titleColor = [UIColor darkGrayColor];
    self.marqueeView.titleArr = @[@"公告1", @"公告2"];
    [self.marqueeView start];}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
