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
    if (![model isKindOfClass:[NSDictionary class]]) {
        return;
    }
    id superObj = [super initWithFrame:self.frame separateMode:UISeparatableViewSeparateModeNone];
    superObj=nil;
    BILog(@"%@",superObj);
    [self createCellContentView];
    
    NSString *pic;
    if([model objectForKey:@"month"] &&  ![[model objectForKey:@"month"] isEqualToString:@""]){//房价
        NSString *month= [model objectForKey:@"month"];
        pic = [model objectForKey:@"pic"];
        NSString *year = [model objectForKey:@"year"];
        lbl.text = [NSString stringWithFormat:@"%@年%@月份70个大中城市住宅销售价格变动情况",year,month];
        timeLbl.text = @"来源：国家统计局";
        recommandLbl.text = @"推荐";
        lbl.font = [UIFont systemFontOfSize:15.0];
        [lbl sizeToFit];
    }
    else if([model objectForKey:@"detailUrl"]){//movie
        lbl.text =  [model objectForKey:@"name"] ;
        lbl.font = [UIFont systemFontOfSize:18.0];
        pic =[model objectForKey:@"url"] ;
        id score = [model objectForKey:@"score"];
        timeLbl.hidden = YES;
        NSString *startImg = @"";
        NSInteger size = ((NSNumber*)score).integerValue;//score<int>类型
        if (size ==10) {
            startImg = @"start10.png";
        }
        else if(size>=9 && size<10){
            startImg = @"start9.png";
        }
        else if (size>2 && size<9){
             startImg = @"start6.png";
        }
        else{
            startImg = @"start2.png";
        }
        recommandLbl.text = @"豆瓣Top电影";
        //强插图片
        UIImageView *imgv = [[UIImageView alloc]init];
        [imgv setImage:[UIImage imageNamed:startImg]];
        imgv.frame = CGRectMake(timeLbl.viewX, timeLbl.viewY, 84, 15);
        [self addSubview:imgv];
        timeLbl.viewX = imgv.viewXRight+5;
        UILabel *commentlbl = [[UILabel alloc]initWithFrame:CGRectMake(imgv.viewX, imgv.viewY - 20, 100, 12)];
        commentlbl.text = [model objectForKey:@"comment"];
        commentlbl.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:commentlbl];
    }
    else if([model objectForKey:@"activityUrl"]){//activity
        lbl.numberOfLines = 1;
        lbl.viewWidth = self.viewWidth-img.viewXRight-150;
        lbl.text =  [model objectForKey:@"name"] ;
        pic =[model objectForKey:@"url"] ;
        NSString *price = [model objectForKey:@"price"];
        if (price.length>3) {
            price = [price substringToIndex:3];
        }
        recommandLbl.text = price;
        timeLbl.text =  [model objectForKey:@"address"] ;
        lbl.font = [UIFont systemFontOfSize:15.0];
        [lbl sizeToFit];
        //强插UILabel
        NSString *dateStr = [model objectForKey:@"date"] ;
        UILabel *commentlbl = [[UILabel alloc]initWithFrame:CGRectMake(timeLbl.viewX, timeLbl.viewY - 20, self.viewWidth-img.viewXRight-20, 12)];
        commentlbl.text = dateStr;
        commentlbl.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:commentlbl];
    }

    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",pic]];
    [img sd_setImageWithPreviousCachedImageWithURL:url andPlaceholderImage:[UIImage imageNamed:@"overlay.png"] options:SDWebImageDelayPlaceholder progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        //BILog(@"%ld",receivedSize/expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //BILog(@"loadSuccess %@",imageURL);
    }];
    
    recommandLbl.textAlignment = NSTextAlignmentRight;
    NSDictionary *attribute = @{NSFontAttributeName: recommandLbl.font};
    CGSize size = [recommandLbl.text boundingRectWithSize:CGSizeMake(300, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
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
    timeLbl.frame = CGRectMake(lbl.viewX, lbl.viewYBelow+20, 200, 15);
    recommandLbl.frame = CGRectMake(timeLbl.viewXRight, timeLbl.viewY, lbl.viewWidth/2, 15);
    iconImg.frame = CGRectMake(0, timeLbl.viewY, 15, 15);
    
}

@end
