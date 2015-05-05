//
//  BIGroupCell.m
//  Bike
//
//  Created by Yuki on 15/5/4.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIGroupCell.h"
//#import "UIImageView+WebCache.h"

@interface BIGroupCell()
@property (nonatomic,strong) UIImageView *userImg;
@property (nonatomic,strong) UILabel *userNameLbl;
@property (nonatomic,strong) UILabel *contentLbl;
@property (nonatomic,strong) UIView *imgView;
@property (nonatomic,strong) UILabel *timeLbl;
@property (nonatomic,strong) UIButton *deleteBtn;
@property (nonatomic,strong) UIButton *appendBtn;//回复按钮

@end

@implementation BIGroupCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateCell:(id)model{
    [self createCellContentView];
    [self layoutCellContentView];
}

- (void)layoutCellContentView{
    
}

- (void)createCellContentView{
    if(!self.userNameLbl){
        self.userNameLbl = [[UILabel alloc]init];
        self.userNameLbl.numberOfLines = 6;
        [self addSubview:self.userNameLbl];
    }
    if(!self.userImg){
        self.userImg = [[UIImageView alloc]init];
        [self addSubview:self.userImg];
    }
    
    if(!self.contentLbl){
        self.contentLbl = [[UILabel alloc]init];
        [self addSubview:self.contentLbl];
    }
    if(!self.imgView){
        self.imgView = [[UIView alloc]init];
        [self addSubview:self.imgView];
    }
    if(!self.timeLbl){
        self.timeLbl = [[UILabel alloc]init];
        [self addSubview:self.timeLbl];
    }
    if(!self.deleteBtn){
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.deleteBtn];
    }
    if(!self.appendBtn){
        self.appendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.appendBtn];
    }
}


@end
