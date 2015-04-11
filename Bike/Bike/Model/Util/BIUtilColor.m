//
//  BIUtilColor.m
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import "BIUtilColor.h"

@implementation BIUtilColor


// 获取颜色
+ (UIColor *)getColor:(NSString *)hexColor
{
    if(hexColor == nil)
    {
        return [UIColor clearColor];
    }
    
    if([hexColor hasPrefix:@"0x"] == YES || [hexColor hasPrefix:@"0X"] == YES )
    {
        hexColor = [hexColor substringFromIndex:2];
    }
    
    if([hexColor hasPrefix:@"#"] == YES)
    {
        hexColor = [hexColor substringFromIndex:1];
    }
    
    if([hexColor length] != 6)
    {
        return [UIColor clearColor];
    }
    
    unsigned int red,green,blue;
    
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}


+ (UIColor *)getColor:(NSString *)hexColor alpha:(CGFloat)alpha
{
    if(hexColor == nil)
    {
        return [UIColor clearColor];
    }
    
    if([hexColor hasPrefix:@"0x"] == YES ||[hexColor hasPrefix:@"0X"] == YES )
    {
        hexColor = [hexColor substringFromIndex:2];
    }
    
    if([hexColor hasPrefix:@"#"] == YES)
    {
        hexColor = [hexColor substringFromIndex:1];
    }
    
    if([hexColor length] != 6)
    {
        return [UIColor clearColor];
    }
    
    unsigned int red,green,blue;
    
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:alpha];
}

@end
