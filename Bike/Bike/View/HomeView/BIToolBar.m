//
//  BIToolBar.m
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIToolBar.h"

@implementation BIToolBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

- (void)createBar{
    int W = self.viewWidth /3;
    int H = self.viewHeight;
    
    UIButton *first = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *second = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *third = [UIButton buttonWithType:UIButtonTypeCustom];
    [first setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [second setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [third setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [first setFrame:CGRectMake(0, 0, W, H)];
    [second setFrame:CGRectMake(W, 0, W, H)];
    [third setFrame:CGRectMake(2*W, 0, W, H)];
    
    
}

@end
