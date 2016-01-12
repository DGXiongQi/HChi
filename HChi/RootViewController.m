//
//  RootViewController.m
//  HChi
//
//  Created by uniQue on 16/1/11.
//  Copyright © 2016年 uniQue. All rights reserved.
//

#import "RootViewController.h"
#import "TableViewDataSource.h"
#import "RootViewCell.h"
#import "GuessYouLikeViewController.h"
#import "HCGlobalVariable.h"

static NSString * const RootViewCellIdentifier = @"RootCell";

@interface RootViewController ()<UITableViewDelegate>

@property (nonatomic, strong) TableViewDataSource * rootViewDataSource;

@end

@implementation RootViewController

#pragma mark 初始化 init
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTitle:@"有雅兴"];
    }
    return self;
}

#pragma mark 加载完毕 View did load
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航栏颜色渐变
    [self.navigationController.navigationBar.layer insertSublayer:HCNCBackgroundForRootView atIndex:0];
    
    [self initMyView];
}

- (void)initMyView {
    
    _rootTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenFrame.width, ScreenFrame.height) style:UITableViewStyleGrouped];
    
    TableViewCellConfigureBlock rootViewCellConfigureBlock = ^(RootViewCell* rootCell, NSDictionary* Item) {
        [rootCell configureCellWithData:Item];
    };
    
    self.rootViewDataSource = [[TableViewDataSource alloc]
                                initWithItems:@[@[@{@"title":@"第一节"}], @[@{@"title":@"第二节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}], @[@{@"title":@"第三节"}]]
                               cellIdentifier:RootViewCellIdentifier
                                    cellBlock:rootViewCellConfigureBlock];
    
    _rootTableView.delegate = self;
    _rootTableView.dataSource = self.rootViewDataSource;
    
    // 设置tableView 不分开NavgationBar
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 设置tableView 内容滚动范围
    _rootTableView.contentInset = UIEdgeInsetsMake(0, 0, 47, 0);
    // 设置tableView 滚动条滚动范围
    _rootTableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 47, 0);
    // 隐藏滚动条
    _rootTableView.showsVerticalScrollIndicator = NO;
    // 注册NIB 用于复用Cell
    [_rootTableView registerNib:[RootViewCell nib] forCellReuseIdentifier:RootViewCellIdentifier];
    // 将tableView添加到视图上
    [self.view addSubview:_rootTableView];
}

#pragma mark- UITableViewDataSource

#pragma mark- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (indexPath.section == 0) {
       [self.navigationController pushViewController:[GuessYouLikeViewController new] animated:true];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    CGRect scrollViewRect = CGRectMake(0, -64, ScreenFrame.width, 120);
    
    UIScrollView * guessYouLikeScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    guessYouLikeScrollView.contentSize = CGSizeMake(ScreenFrame.width * 4, scrollViewRect.size.height);
    guessYouLikeScrollView.pagingEnabled = YES;
    guessYouLikeScrollView.bounces = NO;
    guessYouLikeScrollView.showsHorizontalScrollIndicator = NO;
    guessYouLikeScrollView.delegate = self;
    guessYouLikeScrollView.backgroundColor = HCNCBackgroundColor;
    return guessYouLikeScrollView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 120;
    } else {
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
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
