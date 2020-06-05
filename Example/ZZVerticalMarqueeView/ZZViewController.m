//
//  ZZViewController.m
//  ZZVerticalMarqueeView
//
//  Created by NilPixel on 06/05/2020.
//  Copyright (c) 2020 NilPixel. All rights reserved.
//

#import "ZZViewController.h"
#import "ZZVerticalMarqueeView.h"

@interface ZZViewController ()

@property (weak, nonatomic) IBOutlet ZZVerticalMarqueeView *marqueeView;

@end

@implementation ZZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.marqueeView.titleFont = [UIFont systemFontOfSize:15];
    self.marqueeView.titleColor = [UIColor darkGrayColor];
    self.marqueeView.titleArr = @[@"公告1", @"公告2"];
    [self.marqueeView start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
