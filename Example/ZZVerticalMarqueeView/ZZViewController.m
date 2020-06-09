//
//  ZZViewController.m
//  ZZVerticalMarqueeView
//
//  Created by NilPixel on 06/05/2020.
//  Copyright (c) 2020 NilPixel. All rights reserved.
//

#import "ZZViewController.h"
#import "ZZMarqueeViewController.h"

@interface ZZViewController ()

@end

@implementation ZZViewController

- (IBAction)jumpBtnClicked:(UIButton *)sender {
    ZZMarqueeViewController *marqueeVC = [[ZZMarqueeViewController alloc] init];
    [self.navigationController pushViewController:marqueeVC animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
