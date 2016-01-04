//
//  CityFJView.h
//  hellodemo
//
//  Created by Yuki on 15/12/29.
//  Copyright © 2015年 DianPing. All rights reserved.
//  别理会sb式代码

#import <UIKit/UIKit.h>


@interface CityFJView : UIView
@property (strong, nonatomic)   UILabel *title;
@property (strong, nonatomic)   UILabel *subTitle;
@property (strong, nonatomic)   UILabel *plbl1;
@property (strong, nonatomic)   UILabel *plbl2;
@property (strong, nonatomic)   UILabel *plbl3;
@property (strong, nonatomic)   UILabel *psublbl1;
@property (strong, nonatomic)   UILabel *psublbl2;
@property (strong, nonatomic)   UILabel *psublbl3;
@property (strong, nonatomic)   UIView *centerline;
@property (strong, nonatomic)   UIView *center1_1;
@property (strong, nonatomic)   UIView *center1_2;
@property (strong, nonatomic)   UIView *centertop;
@property (strong, nonatomic)   UIView *centerbtm;
@property (strong, nonatomic)   UIView *top1_1;
@property (strong, nonatomic)   UIView *top1_2;

- (void)setLabelFrame:(CGRect)frame;
//+ (instancetype)initFJ;
@end
