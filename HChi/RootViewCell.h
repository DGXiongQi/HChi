//
//  RootViewCell.h
//  HChi
//
//  Created by uniQue on 16/1/11.
//  Copyright © 2016年 uniQue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HCGlobalVariable;
@interface RootViewCell : UITableViewCell

+ (UINib *)nib;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@property (nonatomic, strong) HCGlobalVariable* hcGV;

- (void)configureCellWithData:(NSDictionary *)dic;

@end
