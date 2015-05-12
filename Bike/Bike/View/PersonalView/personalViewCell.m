//
//  personalViewCell.m
//  Bike
//
//  Created by Yuki on 15/5/12.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "personalViewCell.h"
#import <Masonry/Masonry.h>


@interface personalViewCell(){
    
}
@property (nonatomic,strong) UILabel *userNameLbl;
@end

@implementation personalViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateCell:(NSString*)title{
    [self createCellContentView];
    [self layoutCellContentView];
    
    self.userNameLbl.text = title;
    
}

- (void)layoutCellContentView{
    self.userNameLbl.viewHeight = 44;
    self.userNameLbl.viewX = 15;
    self.userNameLbl.viewWidth = self.viewWidth-15;
}

- (void)createCellContentView{
    if(!self.userNameLbl){
        self.userNameLbl = [[UILabel alloc]init];
        [self addSubview:self.userNameLbl];
    }
}

@end
