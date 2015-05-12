//
//  UISeparatableTableViewCell.m
//  Bike
//
//  Created by kyu on 15/4/14.
//  Copyright (c) 2015年 kyu. All rights reserved.
//

#import "UISeparatableTableViewCell.h"


#define HJRStandardSeparatorGrayColor [UIColor colorWithRed:200.f/255.f green:199.f/255.f blue:204.f/255.f alpha:1.f]

@interface UISeparatableTableViewCell ()

@property (nonatomic, strong) UIView *separatorView;

@end

@implementation UISeparatableTableViewCell
@synthesize separatorView = _separatorView;
@synthesize separatorInset = _separatorInset;
@synthesize separatorColor = _separatorColor;

- (instancetype)initWithFrame:(CGRect)frame separateMode:(UISeparatableViewSeparateMode)separateMode
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        
        _separateMode = separateMode;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _separateMode = UISeparatableViewSeparateModeTop;
    _separatorLineWidth = .5f;
    _separatorViewWidth = CGRectGetWidth(self.bounds);
}

#pragma mark - Getters

- (UIView *)separatorView
{
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = HJRStandardSeparatorGrayColor;
        [self addSubview:_separatorView];
    }
    return _separatorView;
}

#pragma mark - Setters

- (void)setSeparateMode:(UISeparatableViewSeparateMode)separateMode
{
    _separateMode = separateMode;
    
    [self setNeedsLayout];
}

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
    _separatorInset = separatorInset;
    
    [self setNeedsLayout];
}

- (void)setSeparatorLineWidth:(CGFloat)separatorLineWidth
{
    _separatorLineWidth = separatorLineWidth;
    
    [self setNeedsLayout];
}

- (void)setSeparatorColor:(UIColor *)separatorColor
{
    _separatorColor = separatorColor;
    
    self.separatorView.backgroundColor = _separatorColor ?: HJRStandardSeparatorGrayColor;
    [self.separatorView setNeedsDisplay];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.separatorView.frame = UIEdgeInsetsInsetRect([self separatorViewFrame], [self adjustedSeparatorInset]);
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
    
    [self sendSubviewToBack:self.separatorView];
}

#pragma mark - Private

- (CGRect)separatorViewFrame
{
    switch (self.separateMode) {
        case UISeparatableViewSeparateModeTop:
            return (CGRect) {
                .origin.x = CGRectGetWidth(self.bounds)-_separatorViewWidth,
                .origin.y = 0,
                .size.width = _separatorViewWidth,
                .size.height = self.separatorLineWidth,
            };
            break;
        case UISeparatableViewSeparateModeBottom:
            return (CGRect) {
                .origin.x = CGRectGetWidth(self.bounds)-_separatorViewWidth,
                .origin.y = CGRectGetMaxY(self.bounds) - self.separatorLineWidth,
                .size.width = _separatorViewWidth,
                .size.height = self.separatorLineWidth,
            };
            break;
        case UISeparatableViewSeparateModeLeft:
            return (CGRect) {
                .origin.x = 0,
                .origin.y = 0,
                .size.width = self.separatorLineWidth,
                .size.height = CGRectGetHeight(self.bounds),
            };
            break;
        case UISeparatableViewSeparateModeRight:
            return (CGRect) {
                .origin.x = CGRectGetMaxX(self.bounds) - self.separatorLineWidth,
                .origin.y = 0,
                .size.width = self.separatorLineWidth,
                .size.height = CGRectGetHeight(self.bounds),
            };
            break;
        case UISeparatableViewSeparateModeNone:
            return CGRectZero;
            break;
    }
    return CGRectZero;
}

- (UIEdgeInsets)adjustedSeparatorInset
{
    switch (self.separateMode) {
        case UISeparatableViewSeparateModeTop:
        case UISeparatableViewSeparateModeBottom:
            return (UIEdgeInsets) {
                .top = 0,
                .left = self.separatorInset.left,
                .bottom = 0,
                .right = self.separatorInset.right,
            };
            
        case UISeparatableViewSeparateModeLeft:
        case UISeparatableViewSeparateModeRight:
            return (UIEdgeInsets) {
                .top = self.separatorInset.top,
                .left = 0,
                .bottom = self.separatorInset.bottom,
                .right = 0,
            };
        case UISeparatableViewSeparateModeNone:
            return UIEdgeInsetsZero;
            break;
    }
}

@end
