/***  UITableViewCell扩展基础Cell类  ***/

//  BIBaseTableViewCell.h
//  Bike
//  Created by kyu on 15/4/13.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISeparatableTableViewCell.h"

@interface BIBaseTableViewCell : UISeparatableTableViewCell

- (void)updateCell:(id)model;

@end
