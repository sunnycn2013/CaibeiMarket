//
//  AMHomeBannerCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeBannerCell.h"
#import "iCarousel.h"
#import "CMHomeModel.h"
#import "CMHomeBanner.h"

@interface CMHomeBannerCell ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong)iCarousel * scrollView;
@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,strong)CMHomeInfo * bannerModel;

@end

@implementation CMHomeBannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        [self setUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUI
{
    CGFloat width = KScreenWidth;
    CGFloat height = kIPhone6Scale(194.0);
    _scrollView = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _scrollView.delegate = self;
    _scrollView.dataSource = self;
    _scrollView.pagingEnabled = YES;

    _scrollView.type = iCarouselTypeCycle;//iCarouselTypeLinear;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounceDistance = 0.5;
    _scrollView.decelerationRate = 0.5;
    _scrollView.clipsToBounds = YES;
    
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
    [_pageControl setCenterX:self.centerX];
    [_pageControl setMj_y:kIPhone6Scale(194) - 25];
    [_pageControl setNumberOfPages:5];
    [_pageControl setCurrentPage:0];
    [self addSubview:_pageControl];
    self.clipsToBounds = YES;
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMHomeInfo class]]) {
        return;
    }
    self.bannerModel = (CMHomeInfo *)model;
    [self.scrollView reloadData];
}

#pragma iCarousel

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.bannerModel.bannerList.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    CGFloat width = KScreenWidth;
    CGFloat height = kIPhone6Scale(250);
    UIImageView * reuseView = (UIImageView *)view;
    CMHomeBanner * banner = [self.bannerModel.bannerList objectAtIndex:index];
    if (!reuseView) {
        reuseView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        reuseView.contentMode = UIViewContentModeScaleAspectFill;
        [reuseView setImageURL:[NSURL URLWithString:banner.img]];
    }
    return reuseView;
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    NSInteger index = _scrollView.scrollOffset;
    
    [_pageControl setCurrentPage:index];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    CMHomeBanner * banner = [self.bannerModel.bannerList objectAtIndex:index];
    if(self.tapBlock){
        self.tapBlock(banner.jump);
    }
}

- (UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
