//
//  CBNewGuideView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/2.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CBNewGuideView.h"

@interface CBNewGuideView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView  * scrollView;
@property (nonatomic,strong) UIPageControl * pageControl;
@property (nonatomic,strong) UIButton * nextButton;

@end

@implementation CBNewGuideView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    [self addSubview:self.nextButton];
    [self reloadData];
}

- (void)reloadData
{
    [self.scrollView removeAllSubviews];
    for (int i = 0; i<4; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth*i, 0, KScreenWidth, KScreenHeight)];
        NSLog(@"%@",[NSString stringWithFormat:@"0%d.png",(int)(i+1)]);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"0%d.png",(int)(i+1)]];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentSize:CGSizeMake(KScreenWidth * 4, KScreenHeight)];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (void)jumpApp:(UIButton *)button
{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.left - KScreenWidth;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, KScreenHeight - kIPhone6PScale(150), 100, 20)];
        _pageControl.centerX = KScreenWidth/2;
        _pageControl.currentPage = 1;
        _pageControl.numberOfPages = 4;
    }
    return _pageControl;
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectMake(0, KScreenHeight - 100, 150, 44);
        _nextButton.centerX = KScreenWidth/2;
        _nextButton.backgroundColor =CMThemeColor;
        _nextButton.layer.cornerRadius = 12;
        [_nextButton setTitle:@"进入App" forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(jumpApp:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}
@end
