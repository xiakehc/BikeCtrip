//
//  personalViewCell.h
//  Bike
//
//  Created by Yuki on 15/5/12.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIBaseTableViewCell.h"
#import "UISeparatableTableViewCell.h"
#import "BIColorCollection.h"

@interface personalViewCell : BIBaseTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)updateCell:(NSString*)title;
@end
