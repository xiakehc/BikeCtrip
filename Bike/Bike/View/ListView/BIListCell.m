//
//  BIHomeCell.m
//  Bike
//
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIListCell.h"
#import "BIAPIService.h"

@interface BIListCell(){
    UILabel *lbl;
    UIImageView *img;
    UILabel *recommandLbl;
    UILabel *timeLbl;
    UIImageView *iconImg;
}

@end

@implementation BIListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCell:(id)model{
    id superObj = [super initWithFrame:self.frame separateMode:UISeparatableViewSeparateModeNone];
    BILog(@"%@",superObj);
    [self createCellContentView];
    
    NSString *month = [model objectForKey:@"month"];
    NSString *pic = [model objectForKey:@"pic"];
    NSString *year = [model objectForKey:@"year"];
    lbl.text = [NSString stringWithFormat:@"%@年%@月份70个大中城市住宅销售价格变动情况",year,month];
    lbl.font = [UIFont systemFontOfSize:15.0];
    [lbl sizeToFit];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",pic]];
    [img sd_setImageWithPreviousCachedImageWithURL:url andPlaceholderImage:[UIImage imageNamed:@"overlay.png"] options:SDWebImageDelayPlaceholder progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        BILog(@"%ld",receivedSize/expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        BILog(@"loadSuccess %@",imageURL);
    }];
    timeLbl.text = @"来源：国家统计局";
    recommandLbl.text = @"推荐";
    recommandLbl.textAlignment = NSTextAlignmentRight;
    CGSize size =[recommandLbl.text sizeWithFont:recommandLbl.font constrainedToSize:CGSizeMake(100, 15) lineBreakMode:NSLineBreakByClipping];
    recommandLbl.viewX = self.viewWidth - size.width - 10;
    recommandLbl.viewWidth = size.width;
    
    [iconImg setImage:[UIImage imageNamed:@"icon_collect"]];
    iconImg.viewX  = recommandLbl.viewX - 20;
    
    [self setSeparateMode:UISeparatableViewSeparateModeBottom];
}

- (void)createCellContentView{
    if(!lbl){
        lbl = [[UILabel alloc]init];
        lbl.numberOfLines = 2;
        [self addSubview:lbl];
    }
    if(!img){
        img = [[UIImageView alloc]init];
        [self addSubview:img];
    }
    
    if(!recommandLbl){
        recommandLbl = [[UILabel alloc]init];
        recommandLbl.font = [UIFont systemFontOfSize:14.f];
        [self addSubview:recommandLbl];
    }
    if(!timeLbl){
        timeLbl = [[UILabel alloc]init];
        timeLbl.font = [UIFont systemFontOfSize:14.f];
        [self addSubview:timeLbl];
    }
    if(!iconImg){
        iconImg = [[UIImageView alloc]init];
        [self addSubview:iconImg];
    }
    
    img.frame = CGRectMake(0, 0, self.viewHeight, self.viewHeight);
    lbl.frame = CGRectMake(img.viewXRight+15, 10, self.viewWidth-25-img.viewWidth, 30);
    timeLbl.frame = CGRectMake(lbl.viewX, lbl.viewYBelow+20, lbl.viewWidth/2, 15);
    recommandLbl.frame = CGRectMake(timeLbl.viewXRight, timeLbl.viewY, lbl.viewWidth/2, 15);
    iconImg.frame = CGRectMake(0, timeLbl.viewY, 15, 15);
    
}

@end
