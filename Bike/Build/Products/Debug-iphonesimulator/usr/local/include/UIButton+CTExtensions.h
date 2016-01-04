//
//  UIButton+CTExtensions.h
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIButton (CTExtensions)

// 根据状态设置背景色
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@end
