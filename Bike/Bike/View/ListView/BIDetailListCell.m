//
//  BIDetailCell.m
//  Bike
//
//  Created by Yuki on 16/1/4.
//  Copyright © 2016年 kyu. All rights reserved.
//

#import "BIDetailListCell.h"
#import "BIUtilColor.h"
#define TitleLbl  100

@interface BIDetailListCell(){
    UILabel *citylbl;
    UILabel *oneLbl;
    UILabel *secondLbl;
    UILabel *thirdLbl;
    UIView *lineView;
    UIView *leftView;
    UIView *centerView;
    UIView *rightView;
}

@end

@implementation BIDetailListCell

- (void)updateCell:(id)model{
     [self createCellContentView];
    
    NSString *cityName = [model objectForKey:@"cityName"];
    NSString *one = [model objectForKey:@"key1"];
    NSString *second = [model objectForKey:@"key2"];
    NSString *third = [model objectForKey:@"key3"];
    
    citylbl.text = cityName;
    secondLbl.text = second;
    thirdLbl.text = third;
    
    NSString *oneUpStr = one;
    oneUpStr = [oneUpStr stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(one.integerValue>second.integerValue){
       oneUpStr = [oneUpStr stringByAppendingString:@"↑"];
    }
    if(one.integerValue>third.integerValue){
        oneUpStr =[oneUpStr stringByAppendingString:@"↑"];
    }
    oneLbl.text = oneUpStr;
}

- (void)createCellContentView{
    if(!citylbl){
        citylbl = [[UILabel alloc]init];
        citylbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:citylbl];
    }
    if(!oneLbl){
        oneLbl = [[UILabel alloc]init];
        oneLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:oneLbl];
    }
    if(!secondLbl){
        secondLbl = [[UILabel alloc]init];
        secondLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:secondLbl];
    }
    if(!thirdLbl){
        thirdLbl = [[UILabel alloc]init];
        thirdLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:thirdLbl];
    }
    if(!lineView){
        lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.viewHeight-0.5, self.viewWidth, 0.5)];
        [self addSubview:lineView];
    }
    if(!leftView){
        leftView = [[UIView alloc]initWithFrame:CGRectMake(TitleLbl, 0, 0.5, self.viewHeight-0.5)];
        [self addSubview:leftView];
        centerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0.5, self.viewHeight-0.5)];
        [self addSubview:centerView];
        rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0.5, self.viewHeight-0.5)];
        [self addSubview:rightView];
    }
    
    CGFloat W = (self.viewWidth-TitleLbl)/3.0;
    citylbl.frame = CGRectMake(0, 0, TitleLbl, self.viewHeight);
    oneLbl.frame = CGRectMake(citylbl.viewXRight, 0, W, self.viewHeight);
    secondLbl.frame = CGRectMake(oneLbl.viewXRight, 0, W, self.viewHeight);
    thirdLbl.frame = CGRectMake(secondLbl.viewXRight, 0, W, self.viewHeight);
    lineView.backgroundColor =  [UIColor grayColor];
    leftView.backgroundColor =  [UIColor grayColor];
    centerView.backgroundColor =  [UIColor grayColor];
    rightView.backgroundColor =  [UIColor grayColor];
    centerView.viewX = oneLbl.viewXRight+0.8;
    rightView.viewX = secondLbl.viewXRight+0.6;
}

@end
