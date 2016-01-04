//
//  UIButton+CTExtensions.m
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
