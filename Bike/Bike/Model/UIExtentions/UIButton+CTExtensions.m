//
//  UIButton+CTExtensions.m
//  CTRIP_WIRELESS
//
//  Created by Haoran Chen on 11/13/13.
//  Copyright (c) 2013 携程. All rights reserved.
//

#import "UIButton+CTExtensions.h"

@implementation UIButton (CTExtensions)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    UIView *colorView = [[UIView alloc] initWithFrame:self.frame];
    colorView.backgroundColor = color;
	
    UIGraphicsBeginImageContext(colorView.bounds.size);
    [colorView.layer renderInContext:UIGraphicsGetCurrentContext()];
	
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
	[self setBackgroundImage:colorImage forState:state];
}

@end
