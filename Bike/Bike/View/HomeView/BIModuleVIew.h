//
//  BIModuleVIew.h
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//  架构View

#import <UIKit/UIKit.h>
#import "BIModuleModel.h"

@interface BIModuleVIew : UIView

- (instancetype)initWithFrame:(CGRect)frame withList:(NSArray*)list withColor:(UIColor *)color withKey:(NSInteger)key;

@end
