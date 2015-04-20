//
//  UIButton+CTExtensions.h
//  CTRIP_WIRELESS
//
//  Created by Haoran Chen on 11/13/13.
//  Copyright (c) 2013 携程. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIButton (CTExtensions)

// 根据状态设置背景色
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
