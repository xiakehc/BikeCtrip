//
//  UISeparatableTableViewCell.h
//  Bike
//
//  Created by kyu on 15/4/14.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UISeparatableViewSeparateMode) {
    UISeparatableViewSeparateModeNone,
    UISeparatableViewSeparateModeTop,
    UISeparatableViewSeparateModeBottom,
    UISeparatableViewSeparateModeLeft,
    UISeparatableViewSeparateModeRight
};


@interface UISeparatableTableViewCell : UITableViewCell

- (instancetype)initWithFrame:(CGRect)frame separateMode:(UISeparatableViewSeparateMode)separateMode;

@property (nonatomic, assign) UISeparatableViewSeparateMode separateMode UI_APPEARANCE_SELECTOR; // default is UISeparatableViewSeparateMode
@property (nonatomic, assign) UIEdgeInsets separatorInset UI_APPEARANCE_SELECTOR; // allows customization of the frame of separators
@property (nonatomic, assign) CGFloat separatorLineWidth UI_APPEARANCE_SELECTOR; // default = 0.5
@property (nonatomic, strong) UIColor *separatorColor UI_APPEARANCE_SELECTOR; // default is the standard separator gray
@property (nonatomic, assign) CGFloat separatorViewWidth UI_APPEARANCE_SELECTOR; // default = self.bound

@end
