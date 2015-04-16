//
//  BIToolBar.m
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIToolBar.h"
#import "BIDefine.h"
#import "HJRSeparatableView.h"

@implementation BIToolBar

- (instancetype)initWithFrame:(CGRect)frame{
    CGRect rect = frame;
    rect.origin.y = 0;//转换Y
    rect.origin.x = 0;//转换X
    
    self = [super initWithFrame:rect];
    if(self){
        [self createToolBar];
    }
    return self;
}

- (void)createToolBar{
    NSInteger W = self.viewWidth /3;
    NSInteger H = self.viewHeight;
    
    UIButton *first = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *second = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *third = [UIButton buttonWithType:UIButtonTypeCustom];
    [first setImage:[UIImage imageNamed:@"Home.png"] forState:UIControlStateNormal];
    [second setImage:[UIImage imageNamed:@"Activity.png"] forState:UIControlStateNormal];
    [third setImage:[UIImage imageNamed:@"Person.png"] forState:UIControlStateNormal];
    [first setFrame:CGRectMake(0, 0, W, H)];
    [second setFrame:CGRectMake(W, 0, W, H)];
    [third setFrame:CGRectMake(2*W, 0, W, H)];
    
    [self addSubview:first];
    [self addSubview:second];
    [self addSubview:third];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.viewWidth, 1.0)];
    line.backgroundColor = [UIColor colorWithRed:200.f/255.f green:199.f/255.f blue:204.f/255.f alpha:1.f];
    [self addSubview:line];
    
//    UIView *centerLine1 = [[UIView alloc]initWithFrame:CGRectMake(W, 0, 1.0, H)];
//    line.backgroundColor = [UIColor colorWithRed:200.f/255.f green:199.f/255.f blue:204.f/255.f alpha:1.f];
//    [self addSubview:centerLine1];
//    UIView *centerLine2 = [[UIView alloc]initWithFrame:CGRectMake(2*W, 0, 1.0, H)];
//    line.backgroundColor = [UIColor colorWithRed:200.f/255.f green:199.f/255.f blue:204.f/255.f alpha:1.f];
//    [self addSubview:centerLine2];
}

@end
