//
//  BIModuleVIew.m
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIModuleVIew.h"
#import <Masonry/Masonry.h>

@interface BIModuleVIew(){
    NSInteger _tagKey;
}

@property (nonatomic,strong) id<BIModuleVIewDelegate> delegate;

@end

@implementation BIModuleVIew

- (instancetype)initWithFrame:(CGRect)frame withList:(NSArray*)list withColor:(UIColor *)color withKey:(NSInteger)key withDelegate:(id<BIModuleVIewDelegate>)delegate{
    CGRect rect = frame;
    rect.origin.y = 0;//转换Y
    rect.origin.x = 0;//转换X
    self = [super initWithFrame:rect];
    
    _tagKey = key;
    if(self){
        [self initBaseView:list withColor:color];
        self.delegate = delegate;
    }
    return self;
}

- (void)initBaseView:(NSArray*)list withColor:(UIColor *)color
{
    UIButton *leftView = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *centerTopView = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *centerBottomView = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *rightTopView = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *rightBottomView = [UIButton buttonWithType:UIButtonTypeCustom];
    leftView.backgroundColor = centerTopView.backgroundColor =
    centerBottomView.backgroundColor = rightBottomView.backgroundColor
    = rightTopView.backgroundColor = color;
    //tag
    leftView.tag = _tagKey;
    centerTopView.tag = _tagKey + 1;
    centerBottomView.tag = _tagKey + 2;
    rightTopView.tag = _tagKey + 3;
    rightBottomView.tag = _tagKey + 4;
    //action
    [leftView addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerTopView addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [centerBottomView addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightTopView addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [rightBottomView addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    NSInteger width = (self.viewWidth - 10)/3;
    NSInteger height = (self.viewHeight - 5)/2;
    
    [leftView setFrame:CGRectMake(0, 0, width, self.viewHeight)];
    [centerTopView setFrame:CGRectMake(leftView.viewXRight+5, 0, width, height)];
    [centerBottomView setFrame:CGRectMake(leftView.viewXRight+5, centerTopView.viewYBelow+5, width, height)];
    [rightTopView setFrame:CGRectMake(centerTopView.viewXRight+5, 0, width, height)];
    [rightBottomView setFrame:CGRectMake(centerTopView.viewXRight+5, rightTopView.viewYBelow+5, width, height)];
    
    BIModuleModel* leftmodel = (BIModuleModel*)[list objectAtIndex:0];
    [leftView setTitle:leftmodel.content forState:UIControlStateNormal];
    
    BIModuleModel* centermodel = (BIModuleModel*)[[list objectAtIndex:1]objectAtIndex:0];
    [centerTopView setTitle:centermodel.content forState:UIControlStateNormal];
    centermodel = (BIModuleModel*)[[list objectAtIndex:1]objectAtIndex:1];
    [centerBottomView setTitle:centermodel.content forState:UIControlStateNormal];
    
    BIModuleModel* rightmodel = (BIModuleModel*)[[list objectAtIndex:2]objectAtIndex:0];
    [rightTopView setTitle:rightmodel.content forState:UIControlStateNormal];
    rightmodel = (BIModuleModel*)[[list objectAtIndex:2]objectAtIndex:1];
    [rightBottomView setTitle:rightmodel.content forState:UIControlStateNormal];
    
    [self addSubview:leftView];
    [self addSubview:centerTopView];
    [self addSubview:centerBottomView];
    [self addSubview:rightBottomView];
    [self addSubview:rightTopView];
}

- (void)btnClick:(id)sender{
    NSInteger tag = ((UIButton*)sender).tag;
    
    [self.delegate homeBIModuleVIewButtonClick:tag];
}

@end
