//
//  PersonViewController.m
//  HChi
//
//  Created by uniQue on 16/1/11.
//  Copyright © 2016年 uniQue. All rights reserved.
//

#import "PersonViewController.h"
#import "HCGlobalVariable.h"
#import "TableViewDataSource.h"
#import "PersonViewCell.h"

static NSString * const PersonViewCellIdentifier = @"PersonCell";

@interface PersonViewController ()<UITableViewDelegate>

@property (nonatomic, strong) TableViewDataSource * personViewCellDataSource;

@end


@implementation PersonViewController

CGRect headViewRect;
UIView * headView;
UIImageView * imageView;

#pragma mark 初始化 init
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"个人";
    }
    return self;
}
#pragma mark 加载完毕 View did load
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
//    [self.navigationController.navigationBar addSubview:HCNCBackgroundForSubView];
    [self initView];
}

#pragma mark 视图将要出现 view will appear
- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)initView {
    
    headViewRect = CGRectMake(0, 0, ScreenSize.width, 200);
    
    #pragma mark 设置列表信息
    _personTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height) style:UITableViewStyleGrouped];
    
    TableViewCellConfigureBlock personViewCellConfigureBlock = ^(PersonViewCell * personCell, NSDictionary * dic){
        [personCell configureCellWithDic:dic];
    };
    
    self.personViewCellDataSource = [[TableViewDataSource alloc] initWithItems:@[@[@{@"title":@"nickName"}]]
                                                                cellIdentifier:PersonViewCellIdentifier
                                                                     cellBlock:personViewCellConfigureBlock];
    
    _personTableView.delegate = self;
    _personTableView.dataSource = self.personViewCellDataSource;
    
    [_personTableView registerClass:[PersonViewCell class] forCellReuseIdentifier:PersonViewCellIdentifier];
    
    [self.view addSubview:_personTableView];
    
    #pragma mark 设置导航栏左右button
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (UIView *)createHeadView {
    
    headView = [[UIView alloc] initWithFrame:headViewRect];
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]];
    imageView.frame = headViewRect;
    
    // 添加模糊效果. dark暗系风格, light 亮系风格, extra light 附加额外的亮光
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = headViewRect;
    [imageView addSubview:effectView];
//    [headView addSubview:imageView];
    [self.view addSubview:imageView];
    
    
    // 用户头像
    UIImageView * userHeadImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img1.jpg"]];
    CGSize userHeadImageSize = CGSizeMake(80, 80);
    userHeadImage.frame = CGRectMake(ScreenSize.width / 2 - userHeadImageSize.width / 2, 30, userHeadImageSize.width, userHeadImageSize.height);
    userHeadImage.layer.cornerRadius = userHeadImageSize.width/2;
    userHeadImage.layer.masksToBounds = true;
    [headView addSubview:userHeadImage];
    
    // 用户昵称
    CGSize userNickNameSize = CGSizeMake(ScreenSize.width / 2, 21);
    UILabel * userNickName = [[UILabel alloc] initWithFrame:CGRectMake(ScreenSize.width / 2 - userNickNameSize.width / 2, userHeadImage.frame.origin.y + userHeadImage.frame.size.height + 10, userNickNameSize.width, userNickNameSize.height)];
    userNickName.textAlignment = NSTextAlignmentCenter;
    userNickName.font = [UIFont systemFontOfSize:14];
    userNickName.textColor = [UIColor whiteColor];
    userNickName.text = @"菩提老祖";
    [headView addSubview:userNickName];
    
    return headView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [self createHeadView];
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return headViewRect.size.height + 20;
    }
    return 10;
}


#pragma mark- UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = _personTableView.contentOffset.y;
    NSLog(@"%f",y);
    if (y < 0) {
        CGRect frame = imageView.frame;
        frame.origin.y = 0;
        frame.size.height = headViewRect.size.height + -y;
        imageView.frame = frame;
    } else {
        CGRect frame = imageView.frame;
        frame.origin.y = -y;
        imageView.frame = frame;
    }
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
