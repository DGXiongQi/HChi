//
//  HCGlobalVariable.m
//  HChi
//
//  Created by uniQue on 16/1/11.
//  Copyright © 2016年 uniQue. All rights reserved.
//

#import "HCGlobalVariable.h"

UIColor * HCNCBackgroundColor = nil;

UIImageView * HCNCBackgroundForSubView = nil;
CAGradientLayer * HCNCBackgroundForRootView = nil;
CGSize ScreenFrame;


@implementation HCGlobalVariable

//- (id)init {
//    self = [super init];
//    if (self) {
//        _ScreenFrame = [UIScreen mainScreen].bounds;
//        _NCBackgroundColor = [UIColor colorWithRed:0.6185 green:0.829 blue:0.6052 alpha:1.0];
//    }
//    return self;
//}

//- (UIImageView *)NCBackgroundForSubView {
//    if (!_NCBackgroundForSubView) {
//        _NCBackgroundForSubView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, _ScreenFrame.size.width, 64)];
//        _NCBackgroundForSubView.backgroundColor = _NCBackgroundColor;
//        return _NCBackgroundForSubView;
//    }
//    return _NCBackgroundForSubView;
//}
//
//- (CAGradientLayer *)NCBackgroundForRootView {
//    if (!_NCBackgroundForRootView) {
//        
////        _NCBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, _ScreenFrame.size.width, 64)];
////        CAGradientLayer* bgLayer = [CAGradientLayer new];
////        bgLayer.frame = CGRectMake(0, 0, _ScreenFrame.size.width, 64);
////        bgLayer.colors = @[_NCBackgroundColor, [UIColor clearColor]];
////        [_NCBackgroundView.layer insertSublayer:bgLayer atIndex:0];
//        
//        _NCBackgroundForRootView = [CAGradientLayer layer];
//        _NCBackgroundForRootView.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64);
//        _NCBackgroundForRootView.colors = [NSArray arrayWithObjects:
//                                    (id)self.NCBackgroundColor.CGColor,
//                                    (id)[self.NCBackgroundColor colorWithAlphaComponent:0.6].CGColor,
//                                    (id)[self.NCBackgroundColor colorWithAlphaComponent:0.3].CGColor,
//                                    (id)[self.NCBackgroundColor colorWithAlphaComponent:0.0].CGColor,
//                                    nil];
//        _NCBackgroundForRootView.locations = @[@(0.3), @(0.5), @(0.7), @(1.0)];
//        
//        return _NCBackgroundForRootView;
//    }
//    return _NCBackgroundForRootView;
//}

@end
