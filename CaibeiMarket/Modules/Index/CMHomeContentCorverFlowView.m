//
//  CMHomeContentCorverFlowView.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/1.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeContentCorverFlowView.h"
#import "iCarousel.h"
#import "CMHomeContentCorverFlowItem.h"

#define CMHomeContentCorverFlowTag 5000

@interface CMHomeContentCorverFlowView ()<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic,strong)UILabel * desLabel;
@property (nonatomic,strong)iCarousel * scrollView;
@property (nonatomic,assign) CGFloat itemScaleFactor;
@property (nonatomic, assign) CGFloat interitemSpacing;

@end

@implementation CMHomeContentCorverFlowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self  setUI];
        self.itemScaleFactor = 0.8;
        self.interitemSpacing = 10.0;
    }
    return self;
}

- (void)setUI
{
    [self addSubview:self.scrollView];
    [self.scrollView reloadData];
    
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    self.scrollView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self.scrollView scrollToItemAtIndex:3 animated:YES];
}

- (void)updateItemStyleIndex:(NSInteger)index
{
    NSArray * array = [self.scrollView subviews];
    for (UIView * view in array)
    {
        if ([view isKindOfClass:[CMHomeContentCorverFlowItem class]])
        {
            if (view.tag == CMHomeContentCorverFlowTag + index) {
                [(CMHomeContentCorverFlowItem *)view setStyle:CMHomeContentCorverFlowItemTypeSelected];
            }else{
                [(CMHomeContentCorverFlowItem *)view setStyle:CMHomeContentCorverFlowItemTypeNormal];
            }
        }
    }
}
#pragma iCarousel

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 8;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 4;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    CMHomeContentCorverFlowItem * reuseView = (CMHomeContentCorverFlowItem *)view;
    if (!reuseView) {
        reuseView = [[CMHomeContentCorverFlowItem alloc] initWithFrame:CGRectMake(0, 1, 65, 45)];
        reuseView.backgroundColor = [UIColor clearColor];
        reuseView.tag = CMHomeContentCorverFlowTag +index;
    }
    reuseView.text = [NSString stringWithFormat:@"%ld",(index + 1)* 7];
    [self updateItemStyleIndex:index];
    return reuseView;
}

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    CMHomeContentCorverFlowItem * reuseView = (CMHomeContentCorverFlowItem *)view;
    if (!reuseView) {
        reuseView = [[CMHomeContentCorverFlowItem alloc] initWithFrame:CGRectMake(0, 1, 65, 45)];
        reuseView.backgroundColor = [UIColor clearColor];
//        reuseView.text = [NSString stringWithFormat:@"%ld",index * 7];
        reuseView.tag = CMHomeContentCorverFlowTag +index;
    }
    return reuseView;
}


- (BOOL)carouselShouldWrap:(iCarousel *)carousel {
    return carousel.numberOfItems > 1;
}

- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    CGFloat translate = offset * (carousel.itemWidth - (carousel.itemWidth * (1.0 - self.itemScaleFactor)) / 2 + self.interitemSpacing);
    transform = CATransform3DTranslate(transform, translate, 0.0, 0.0);
    
    // 当offset为0时，scale是1
    // 当offset为1时，scale是self.itemScaleFactor
    // 由此二点可求出直线的方程
    
    // 斜率
    CGFloat k = (self.itemScaleFactor - 1.0) / (1.0 - 0.0);
    // 截距
    CGFloat b = 1.0;
    // 斜截式
    CGFloat y = k * fabs(offset) + b;
    transform = CATransform3DScale(transform, y, y, 1.0);
    NSInteger index = (NSInteger)(carousel.contentOffset.height / 65);
    [self updateItemStyleIndex:index];
    return transform;
}

- (UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
#pragma mark -  set get
- (iCarousel *)scrollView{
    if (!_scrollView) {
        CGFloat width = 65 * 5;
        CGFloat margin = (KScreenWidth - 65*5)/2;
        _scrollView = [[iCarousel alloc] initWithFrame:CGRectMake(margin, 6, width, 45)];
        _scrollView.delegate = self;
        _scrollView.dataSource = self;
        _scrollView.pagingEnabled = YES;
        
        _scrollView.type = iCarouselTypeCycle;//iCarouselTypeLinear;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounceDistance = 0.5;
        _scrollView.decelerationRate = 0.3;
        _scrollView.clipsToBounds = YES;
    }
    return _scrollView;
}
@end
