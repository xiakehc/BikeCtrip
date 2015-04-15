//
//  BIScrollImageView.m
//  ImagePlayerView
//
//  Created by Yuki on 15/4/14.
//  Copyright (c) 2015年 Chenyanjun. All rights reserved.
//

#import "BIScrollImageView.h"
#import "UIImageView+WebCache.h"

#define kStartTag   1000                //目前支持最大滚动图片个数
#define kDefaultScrollInterval  2   //默认轮询时间

@interface BIScrollImageView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageURLs;
@property (nonatomic, strong) NSTimer *autoScrollTimer;
@property (nonatomic, strong) NSMutableArray *pageControlConstraints;

@end

@implementation BIScrollImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (void)_init
{
    self.scrollInterval = kDefaultScrollInterval;
    
    //scrollView
    self.scrollView = [[UIScrollView alloc]init];
    [self addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.delegate = self;
    
    // UIPageControl
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    self.pageControl.numberOfPages = self.count;
    self.pageControl.currentPage = 0;
    [self addSubview:self.pageControl];
    
    //constraint
    NSArray *pageControlVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[pageControl]-0-|"
                                                                               options:kNilOptions
                                                                               metrics:nil
                                                                                 views:@{@"pageControl": self.pageControl}];
    
    NSArray *pageControlHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[pageControl]-|"
                                                                               options:kNilOptions
                                                                               metrics:nil
                                                                                 views:@{@"pageControl": self.pageControl}];
    
    self.pageControlConstraints = [NSMutableArray arrayWithArray:pageControlVConstraints];
    [self.pageControlConstraints addObjectsFromArray:pageControlHConstraints];
    
    [self addConstraints:self.pageControlConstraints];
}

#pragma mark - API
- (void)initWithImageURLs:(NSArray *)imageURLs placeholder:(UIImage *)placeholder delegate:(id<BIScrollImageViewDelegate>)delegate
{
    [self initWithURL:imageURLs delegate:delegate edgeInsets:UIEdgeInsetsZero];
}

- (void)initWithImageURLs:(NSArray *)imageURLs placeholder:(UIImage *)placeholder delegate:(id<BIScrollImageViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets
{
    [self initWithURL:imageURLs delegate:delegate edgeInsets:edgeInsets];
}

//- (void)initWithCount:(NSInteger)count delegate:(id<BIScrollImageViewDelegate>)delegate
//{
//    [self initWithCount:count delegate:delegate edgeInsets:UIEdgeInsetsZero];
//}

/**
 *  Protect Method
 *
 *  @param imageURLs
 *  @param delegate
 *  @param edgeInsets
 */
- (void)initWithURL:(NSArray*)imageURLs delegate:(id<BIScrollImageViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets
{
    self.count = imageURLs.count;
    self.imagePlayerViewDelegate = delegate;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-%d-[scrollView]-%d-|", (int)edgeInsets.top, (int)edgeInsets.bottom]
                                                                 options:kNilOptions
                                                                 metrics:nil
                                                                   views:@{@"scrollView": self.scrollView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|-%d-[scrollView]-%d-|", (int)edgeInsets.left, (int)edgeInsets.right]
                                                                 options:kNilOptions
                                                                 metrics:nil
                                                                   views:@{@"scrollView": self.scrollView}]];
    
    if (imageURLs.count == 0) {
        return;
    }
    
    self.pageControl.numberOfPages = imageURLs.count;
    self.pageControl.currentPage = 0;
    self.imageURLs = imageURLs;
    
    CGFloat startX = self.scrollView.bounds.origin.x;
    CGFloat width = self.bounds.size.width - edgeInsets.left - edgeInsets.right;
    CGFloat height = self.bounds.size.height - edgeInsets.top - edgeInsets.bottom;
    
    for (int i=0; i<imageURLs.count; i++) {
        startX = i * width;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(startX, 0, width, height)];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.tag = kStartTag + i;
        imageView.userInteractionEnabled = YES;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)]];
        
        NSURL *url =  [imageURLs objectAtIndex:i];
        [imageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            BILog(@"%@",imageURL);
        }];
        
        [self.scrollView addSubview:imageView];
        
        //constraint
        [imageView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
        [imageView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height]];
    }
    
    // constraint
    NSMutableDictionary *viewsDictionary = [NSMutableDictionary dictionary];
    NSMutableArray *imageViewNames = [NSMutableArray array];
    for (int i = kStartTag; i < kStartTag + imageURLs.count; i++) {
        NSString *imageViewName = [NSString stringWithFormat:@"imageView%d", i - kStartTag];
        [imageViewNames addObject:imageViewName];
        
        UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:i];
        [viewsDictionary setObject:imageView forKey:imageViewName];
    }
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-0-[%@]-0-|", [imageViewNames objectAtIndex:0]]
                                                                            options:kNilOptions
                                                                            metrics:nil
                                                                              views:viewsDictionary]];
    
    NSMutableString *hConstraintString = [NSMutableString string];
    [hConstraintString appendString:@"H:|-0"];
    for (NSString *imageViewName in imageViewNames) {
        [hConstraintString appendFormat:@"-[%@]-0", imageViewName];
    }
    [hConstraintString appendString:@"-|"];
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hConstraintString
                                                                            options:NSLayoutFormatAlignAllTop
                                                                            metrics:nil
                                                                              views:viewsDictionary]];
    
    self.scrollView.contentSize = CGSizeMake(width * imageURLs.count, height);
    self.scrollView.contentInset = UIEdgeInsetsZero;
}

#pragma mark - UIScrollViewDeleage
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // disable v direction scroll
    if (scrollView.contentOffset.y > 0) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0)];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // when user scrolls manually, stop timer and start timer again to avoid next scroll immediatelly
    if (self.autoScrollTimer && self.autoScrollTimer.isValid) {
        [self.autoScrollTimer invalidate];
    }
    self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.scrollInterval target:self selector:@selector(handleScrollTimer:) userInfo:nil repeats:YES];
    
    // update UIPageControl
    CGRect visiableRect = CGRectMake(scrollView.contentOffset.x, scrollView.contentOffset.y, scrollView.bounds.size.width, scrollView.bounds.size.height);
    NSInteger currentIndex = 0;
    for (UIImageView *imageView in scrollView.subviews) {
        if ([imageView isKindOfClass:[UIImageView class]]) {
            if (CGRectContainsRect(visiableRect, imageView.frame)) {
                currentIndex = imageView.tag - kStartTag;
                break;
            }
        }
    }
    
    self.pageControl.currentPage = currentIndex;
}

#pragma mark - auto scroll
- (void)setAutoScroll:(BOOL)autoScroll
{
    _autoScroll = autoScroll;
    
    if (autoScroll) {
        if (!self.autoScrollTimer || !self.autoScrollTimer.isValid) {
            self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.scrollInterval target:self selector:@selector(handleScrollTimer:) userInfo:nil repeats:YES];
        }
    } else {
        if (self.autoScrollTimer && self.autoScrollTimer.isValid) {
            [self.autoScrollTimer invalidate];
            self.autoScrollTimer = nil;
        }
    }
}

#pragma mark - Click Event
- (void)handleTapGesture:(UIGestureRecognizer *)tapGesture
{
    UIImageView *imageView = (UIImageView *)tapGesture.view;
    NSInteger index = imageView.tag - kStartTag;
    
    if (self.imagePlayerViewDelegate && [self.imagePlayerViewDelegate respondsToSelector:@selector(imagePlayerViewDidTapAtIndex:)]) {
        [self.imagePlayerViewDelegate imagePlayerViewDidTapAtIndex:index];
    }
}

#pragma mark - Event
- (void)handleScrollTimer:(NSTimer *)timer
{
    if (self.count == 0) {
        return;
    }
    
    NSInteger currentPage = self.pageControl.currentPage;
    NSInteger nextPage = currentPage + 1;
    if (nextPage == self.count) {
        nextPage = 0;
    }
    
    BOOL animated = YES;
    if (nextPage == 0) {
        animated = NO;
    }
    
    UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:(nextPage + kStartTag)];
    [self.scrollView scrollRectToVisible:imageView.frame animated:animated];
    
    self.pageControl.currentPage = nextPage;
}

#pragma mark - Set Property
- (void)setScrollInterval:(NSInteger)scrollInterval
{
    _scrollInterval = scrollInterval;
    
    if (self.autoScrollTimer && self.autoScrollTimer.isValid) {
        [self.autoScrollTimer invalidate];
        self.autoScrollTimer = nil;
    }
    
    self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.scrollInterval target:self selector:@selector(handleScrollTimer:) userInfo:nil repeats:YES];
}

- (void)setPageControlPosition:(ICPageControlPosition)pageControlPosition
{
        NSString *vFormat = nil;
        NSString *hFormat = nil;
    
        switch (pageControlPosition) {
            case ICPageControlPosition_TopLeft: {
                vFormat = @"V:|-0-[pageControl]";
                hFormat = @"H:|-[pageControl]";
                break;
            }
    
            case ICPageControlPosition_TopCenter: {
                vFormat = @"V:|-0-[pageControl]";
                hFormat = @"H:|[pageControl]|";
                break;
            }
    
            case ICPageControlPosition_TopRight: {
                vFormat = @"V:|-0-[pageControl]";
                hFormat = @"H:[pageControl]-|";
                break;
            }
    
            case ICPageControlPosition_BottomLeft: {
                vFormat = @"V:[pageControl]-0-|";
                hFormat = @"H:|-[pageControl]";
                break;
            }
    
            case ICPageControlPosition_BottomCenter: {
                vFormat = @"V:[pageControl]-0-|";
                hFormat = @"H:|[pageControl]|";
                break;
            }
    
            case ICPageControlPosition_BottomRight: {
                vFormat = @"V:[pageControl]-0-|";
                hFormat = @"H:[pageControl]-|";
                break;
            }
    
            default:
                break;
        }
    
        [self removeConstraints:self.pageControlConstraints];
    
        NSArray *pageControlVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vFormat
                                                                                   options:kNilOptions
                                                                                   metrics:nil
                                                                                     views:@{@"pageControl": self.pageControl}];
    
        NSArray *pageControlHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hFormat
                                                                                   options:kNilOptions
                                                                                   metrics:nil
                                                                                     views:@{@"pageControl": self.pageControl}];
    
        [self.pageControlConstraints removeAllObjects];
        [self.pageControlConstraints addObjectsFromArray:pageControlVConstraints];
        [self.pageControlConstraints addObjectsFromArray:pageControlHConstraints];
        
        [self addConstraints:self.pageControlConstraints];
}

- (void)setHidePageControl:(BOOL)hidePageControl
{
    self.pageControl.hidden = hidePageControl;
}

@end
