//
//  BIHomeCell.m
//  Bike
//
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIHomeCell.h"
#import "coupons.h"

@interface BIHomeCell(){
    UILabel *lbl;
}

@end

@implementation BIHomeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCell:(id)model{
    if(!lbl){
        lbl = [[UILabel alloc]initWithFrame:self.frame];
    }
    
    coupons *md = (coupons *)model;
    lbl.text = md.cid;
    lbl.font = [UIFont systemFontOfSize:15.0];
    lbl.textColor = [UIColor blackColor];
}

@end
