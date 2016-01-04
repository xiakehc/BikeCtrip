//
//  CityFJView.m
//  hellodemo
//
//  Created by Yuki on 15/12/29.
//  Copyright © 2015年 DianPing. All rights reserved.
//

#import "CityFJView.h"

#define TitleW  100
#define SUBTitleH  40

@implementation CityFJView

- (void)initLable{
    self.title = [UILabel new];
    self.subTitle = [UILabel new];
    self.plbl1 = [UILabel new];
    self.plbl2 = [UILabel new];
    self.plbl3 = [UILabel new];
    self.psublbl1 = [UILabel new];
    self.psublbl2 = [UILabel new];
    self.psublbl3 = [UILabel new];
    
    self.title.text =@"城市";
    self.subTitle.text = @"新建住宅价格指数";
    self.plbl1.text = @"环比";
    self.plbl2.text = @"同比";
    self.plbl3.text = @"定基";
    self.psublbl1.text = @"上月=100";
    self.psublbl2.text = @"去年同月=100";
    self.psublbl3.text = @"2010年=100";
    self.plbl1.font = [UIFont systemFontOfSize:14.0];
    self.plbl2.font = [UIFont systemFontOfSize:14.0];
    self.plbl3.font = [UIFont systemFontOfSize:14.0];
    self.psublbl1.font = [UIFont systemFontOfSize:12.0];
    self.psublbl2.font = [UIFont systemFontOfSize:12.0];
    self.psublbl3.font = [UIFont systemFontOfSize:12.0];
    self.title.textAlignment = NSTextAlignmentCenter ;
    self.subTitle.textAlignment = NSTextAlignmentCenter ;
    self.plbl1.textAlignment = NSTextAlignmentCenter ;
    self.plbl2.textAlignment = NSTextAlignmentCenter ;
    self.plbl3.textAlignment = NSTextAlignmentCenter ;
    self.psublbl1.textAlignment = NSTextAlignmentCenter ;
    self.psublbl2.textAlignment = NSTextAlignmentCenter ;
    self.psublbl3.textAlignment = NSTextAlignmentCenter ;

    self.centerline = [UIView new];
    self.center1_1 = [UIView new];
    self.center1_2 = [UIView new];
    self.centertop = [UIView new];
    self.centerbtm = [UIView new];
    self.top1_1 = [UIView new];
    self.top1_2 = [UIView new];
    
    self.centerline.backgroundColor = self.center1_1.backgroundColor =  self.center1_2.backgroundColor = self.centertop.backgroundColor = self.centerbtm.backgroundColor = self.top1_1.backgroundColor =  self.top1_2.backgroundColor = [UIColor grayColor];
    
    [self addSubview:self.title];
    [self addSubview:self.subTitle];
    [self addSubview:self.plbl1];
    [self addSubview:self.plbl2];
    [self addSubview:self.plbl3];
    [self addSubview:self.psublbl1];
    [self addSubview:self.psublbl2];
    [self addSubview:self.psublbl3];
    [self addSubview:self.centerline];
    [self addSubview:self.center1_1];
    [self addSubview:self.center1_2];
    [self addSubview:self.centertop];
    [self addSubview:self.centerbtm];
    [self addSubview:self.top1_1];
    [self addSubview:self.top1_2];
}


- (void)setLabelFrame:(CGRect)frame{
    [self initLable];
    [super setFrame:frame];
    if(self){
        CGFloat W = frame.size.width;
        CGFloat H = frame.size.height;
        CGFloat subW = W - TitleW -0.5;
        
        self.title.frame = CGRectMake(0, 0, TitleW, H);
        self.centertop.frame = CGRectMake(0, 0, W, 0.5);
        self.centerline.frame = CGRectMake(TitleW, 0, 0.5, H);
        self.centerbtm.frame =CGRectMake(0, H-0.5, W, 0.5);
        
        self.subTitle.frame = CGRectMake(TitleW+0.5, 0, subW, SUBTitleH);
        self.top1_1.frame = CGRectMake(TitleW+0.5, SUBTitleH, subW, 0.5);
        self.top1_2.frame = CGRectMake(TitleW+0.5, (H-SUBTitleH)/2+SUBTitleH, subW, 0.5);
        
        CGFloat subSubW = subW/3.0;
        self.plbl1.frame = CGRectMake(TitleW+0.5, SUBTitleH+0.5, subSubW, (H-SUBTitleH)/2);
        self.plbl2.frame = CGRectMake(TitleW+1.0+subSubW, SUBTitleH+0.5, subSubW, (H-SUBTitleH)/2);
        self.plbl3.frame = CGRectMake(TitleW+1.5+2*subSubW, SUBTitleH+0.5, subSubW, (H-SUBTitleH)/2);
        self.psublbl1.frame = CGRectMake(TitleW+0.5, SUBTitleH+1.0+(H-SUBTitleH)/2, subSubW, (H-SUBTitleH)/2);
        self.psublbl2.frame = CGRectMake(TitleW+1.0+subSubW, SUBTitleH+1.0+(H-SUBTitleH)/2, subSubW, (H-SUBTitleH)/2);
        self.psublbl3.frame = CGRectMake(TitleW+1.5+2*subSubW, SUBTitleH+1.0+(H-SUBTitleH)/2, subSubW, (H-SUBTitleH)/2);
        
        self.center1_1.frame = CGRectMake(TitleW+1.0+subSubW, SUBTitleH+0.5, 0.5, (H-SUBTitleH));
        self.center1_2.frame = CGRectMake(TitleW+1.0+2*subSubW, SUBTitleH+0.5, 0.5, (H-SUBTitleH));
    }
}
@end
