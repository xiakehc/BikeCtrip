//  轮询滚动图片
//  BIScrollImageView.h
//  ImagePlayerView
//
//  Created by Yuki on 15/4/14.
//  Copyright (c) 2015年 Chenyanjun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ICPageControlPosition) {
    ICPageControlPosition_TopLeft,
    ICPageControlPosition_TopCenter,
    ICPageControlPosition_TopRight,
    ICPageControlPosition_BottomLeft,
    ICPageControlPosition_BottomCenter,
    ICPageControlPosition_BottomRight
};

@protocol BIScrollImageViewDelegate;

@interface BIScrollImageView : UIView

@property (nonatomic,assign) id<BIScrollImageViewDelegate> imagePlayerViewDelegate;
@property (nonatomic,assign) BOOL autoScroll;   // default is YES, set NO to turn off autoScroll
@property (nonatomic,assign) NSInteger scrollInterval; // scroll interval, unit: second, default is 2 seconds
@property (nonatomic, assign) ICPageControlPosition pageControlPosition;    // pageControl position, defautl is bottomright
@property (nonatomic, assign) BOOL hidePageControl; // hide pageControl, default is NO


/**
 *  Init image player
 *
 *  @param imageURLs   NSURL array, image path
 *  @param placeholder placeholder image
 *  @param delegate    delegate
 *  @deprecated use - (void)initWithCount:(NSInteger)count delegate:(id<ImagePlayerViewDelegate>)delegate instead
 */
- (void)initWithImageURLs:(NSArray *)imageURLs placeholder:(UIImage *)placeholder delegate:(id<BIScrollImageViewDelegate>)delegate;

/**
 *  Init image player
 *
 *  @param imageURLs   NSURL array, image path
 *  @param placeholder placeholder image
 *  @param delegate    delegate
 *  @param edgeInsets  scroll view edgeInsets
 *  @deprecated use - (void)initWithCount:(NSInteger)count delegate:(id<ImagePlayerViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets instead
 */
- (void)initWithImageURLs:(NSArray *)imageURLs placeholder:(UIImage *)placeholder delegate:(id<BIScrollImageViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets DEPRECATED_ATTRIBUTE;

/**
 *  Init image player
 *
 *  @param count
 *  @param delegate
 */
//- (void)initWithCount:(NSInteger)count delegate:(id<BIScrollImageViewDelegate>)delegate;

/**
 *  Init image player
 *
 *  @param count
 *  @param delegate
 *  @param edgeInsets scroll view edgeInsets
 */
//- (void)initWithCount:(NSInteger)count delegate:(id<BIScrollImageViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets;

@end

@protocol BIScrollImageViewDelegate <NSObject>

@required
/**
 *  Init imageview
 *
 *  @param imagePlayerView ImagePlayerView object
 *  @param imageView       UIImageView object
 *  @param index           index of imageview
 */
//- (void)imagePlayerView:(BIScrollImageView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index;

@optional
/**
 *  Tap ImageView action
 *
 *  @param imagePlayerView ImagePlayerView object
 *  @param index           index of imageview
 *  @param imageURL        image url
 *  @deprecated use - (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index instead
 */
//- (void)imagePlayerView:(BIScrollImageView *)imagePlayerView didTapAtIndex:(NSInteger)index imageURL:(NSURL *)imageURL DEPRECATED_ATTRIBUTE;

/**
 *  Tap ImageView action
 *
 *  @param imagePlayerView ImagePlayerView object
 *  @param index           index of imageview
 */
//- (void)imagePlayerView:(BIScrollImageView *)imagePlayerView didTapAtIndex:(NSInteger)index;

- (void)imagePlayerViewDidTapAtIndex:(NSInteger)index;
@end
