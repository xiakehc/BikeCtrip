//
//  BIHomeCell.h
//  Bike
//
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "BIBaseTableViewCell.h"
#import "coupons.h"
#import "UIImageView+WebCache.h"

typedef enum{
    VCType_Movie = 0,
    VCType_Activity
}VCType;

@interface BIListCell : BIBaseTableViewCell

@property (nonatomic,assign) VCType vcType;
@end
