//
//  BIDefine.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

/** 字体 */
#define CTFontSysteSize(value)      [UIFont systemFontOfSize:value]     //系统字体
#define CTFontBoldSysteSize(value)  [UIFont boldSystemFontOfSize:value] //系统字体，粗体

/** RGB颜色 */
#define CTColorRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define CTColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/** HEX颜色 */
#define CTColorHex(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]
#define CTColorHexA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:(a)]

/** 位置 */
#define CTScreenHeight              [[UIScreen mainScreen] bounds].size.height     //屏幕的高
#define CTScreenWidth              [[UIScreen mainScreen] bounds].size.width     //屏幕的宽

/** 绘制View边界，方便调试 */
#ifdef DEBUG
#define CTShowViewBounds(aView, aColor) \
do \
{ \
UIColor *color = [(id)aColor isKindOfClass:[UIColor class]] ? aColor : [UIColor redColor]; \
aView.layer.borderColor = color.CGColor; \
aView.layer.borderWidth = 1.0f; \
} \
while(0)
#else
#define CTShowViewBounds(aView)
#endif


#define CURRENTSCREEN_WIDTH [[UIApplication sharedApplication].delegate window].frame.size.width
#define CURRENTSCREEN_HEIGHT [[UIApplication sharedApplication].delegate window].frame.size.height


#define kCTHIPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define kCTHIPadRetina   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)&&([UIScreen mainScreen].scale == 2))
#define isRetina   ([UIScreen mainScreen].scale > 1)