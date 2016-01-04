//
//  BIListDetailViewController.h
//  Bike
//
//  Created by Yuki on 16/1/4.
//  Copyright © 2016年 kyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIListDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSString *month;
@property (nonatomic,strong) NSString *year;

@end
