//
//  RootViewController.m
//  HChi
//
//  Created by uniQue on 16/1/11.
//  Copyright © 2016年 uniQue. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

#pragma mark 初始化 init
- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.title = @"有雅兴";
//        self.tabBarItem.title = @"有雅兴";
        [self.tabBarController.tabBarItem setTitle:@"11"];
    }
    return self;
}

#pragma mark 加载完毕 View did load
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
