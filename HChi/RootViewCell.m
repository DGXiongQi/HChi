//
//  RootViewCell.m
//  HChi
//
//  Created by uniQue on 16/1/11.
//  Copyright © 2016年 uniQue. All rights reserved.
//

#import "RootViewCell.h"
#import "HCGlobalVariable.h"

@implementation RootViewCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"RootViewCell" bundle:nil];
}

- (void)awakeFromNib {
}

- (void)configureCellWithData:(NSDictionary *)dic {
    NSString * title = dic[@"title"];
    self.titleLabel.text = title;
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.hcGV = [HCGlobalVariable new];
        self.titleLabel.shadowColor = HCNCBackgroundColor;
        self.titleLabel.shadowOffset = CGSizeMake(0, 3);
    } else {
        self.titleLabel.shadowColor = nil;
    }
}

@end
