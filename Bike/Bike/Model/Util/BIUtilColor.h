//
//  BIUtilColor.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIUtilColor : NSObject

/*******
 将十六进制的颜色数据准化成UIcolor 的方法
 @param hexColor 十六进制的颜色值 如:0xffffff 0Xffffff #FFFFFF
 */
+ (UIColor *)getColor:(NSString *)hexColor;

/*******
 将十六进制的颜色数据准化成UIcolor 的方法 主要是添加了透明度
 @param hexColor 十六进制的颜色值 如:0xffffff 0Xffffff #FFFFFF
 @param alpha 透明度
 */
+ (UIColor *)getColor:(NSString *)hexColor alpha:(CGFloat)alpha;

@end
