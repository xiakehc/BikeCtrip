//
//  BIMovieDetailViewController.h
//  Bike
//
//  Created by Yuki on 16/1/6.
//  Copyright © 2016年 kyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAOverlay.h"

@interface BIMovieDetailViewController : UIViewController<UIWebViewDelegate>
@property (nonatomic,strong) NSString *url;
@end
