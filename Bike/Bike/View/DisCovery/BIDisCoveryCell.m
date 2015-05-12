//
//  BIDisCoveryCell.m
//  Bike
//
//  Created by Yuki on 15/4/27.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIDisCoveryCell.h"
#import "BIColorCollection.h"


@interface BIDisCoveryCell(){
    UIImageView *img;
    UILabel  *lbl;
}

@end

@implementation BIDisCoveryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updeteCell:(NSString*)name withImg:(NSString*)imgStr{
    if(!img){
        img = [[UIImageView alloc]init];
        [self addSubview:img];
    }
    
    if(!lbl){
        lbl = [[UILabel alloc]init];
        [self addSubview:lbl];
    }
    
    [img setImage:[UIImage imageNamed:imgStr]];
    [lbl setText:name];
    
    [img setFrame:CGRectMake(15, (self.viewHeight-25)/2, 25, 25)];
    [lbl setFrame:CGRectMake(60, 0, 200, self.viewHeight)];
    
    [self setSeparateMode:UISeparatableViewSeparateModeBottom];
    [self setSeparatorLineWidth:0.5];
    [self setSeparatorColor:kBIGainsBoro];
    self.separatorViewWidth = CURRENTSCREEN_WIDTH;
}

@end
