//
//  CMHomeContentCorverFlowView.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/8/1.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeContentCorverFlowView.h"
#import <iCarousel/iCarousel.h>
#import "CMHomeContentCorverFlowItem.h"

@interface CMHomeContentCorverFlowView ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong)UILabel * desLabel;
@property (nonatomic,strong)iCarousel * scrollView;

@end

@implementation CMHomeContentCorverFlowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self  setUI];
    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.scrollView];
    [self.scrollView reloadData];
}

#pragma iCarousel

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 10;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 7;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    UILabel * reuseView = (UILabel *)view;
    if (!reuseView) {
        reuseView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        reuseView.text = @"28";
        reuseView.layer.cornerRadius = 22.5;
        reuseView.layer.borderColor = CMThemeColor.CGColor;
        reuseView.layer.borderWidth = 0.5;
    }
    return reuseView;
}

//- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
//{
//    if (option == iCarouselOptionWrap)
//    {
//        return NO;
//    }
//    return value;
//}


#pragma mark -  set get
- (iCarousel *)scrollView{
    if (!_scrollView) {
        CGFloat width = KScreenWidth - kIPhone6Scale(90);
        CGFloat margin = kIPhone6Scale(90)/2;
        _scrollView = [[iCarousel alloc] initWithFrame:CGRectMake(margin, 6, width, 45)];
        _scrollView.delegate = self;
        _scrollView.dataSource = self;
        _scrollView.pagingEnabled = YES;
        
        _scrollView.type = iCarouselTypeInvertedRotary;//iCarouselTypeLinear;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounceDistance = 0.5;
        _scrollView.decelerationRate = 0.5;
        _scrollView.clipsToBounds = YES;
    }
    return _scrollView;
}
@end
