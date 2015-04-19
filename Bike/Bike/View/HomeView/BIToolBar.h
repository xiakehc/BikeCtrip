//
//  BIToolBar.h
//  Bike
//
//  Created by kyu on 15/4/16.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BIToolBarDelegate<NSObject>

- (void)homeBIToolBarDelegateButtonClick:(NSInteger)index;

@end

@interface BIToolBar : UIView

- (instancetype)initWithFrame:(CGRect)frame withDelegate:(id<BIToolBarDelegate>)delegate;

@end
