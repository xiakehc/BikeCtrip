//
//  BIMoiveViewController.h
//  Bike
//
//  Created by Yuki on 16/1/6.
//  Copyright © 2016年 kyu. All rights reserved.
//  电影、活动页

#import <UIKit/UIKit.h>
#import "BIListCell.h"

@interface BIMoiveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,assign) VCType vcType;

@end
