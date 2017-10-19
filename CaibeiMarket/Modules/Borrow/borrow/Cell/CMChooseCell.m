//
//  CMChooseCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/8.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMChooseCell.h"
#import "CMBorrowChoose.h"
#import "CMChooseItemView.h"

#define CMChooseItemTag  5001

@interface CMChooseCell ()<UIScrollViewDelegate>
@property (nonatomic,strong)CMBorrowChooseItem * choose;
@property (nonatomic,strong)UIScrollView * scrollView;

@end

@implementation CMChooseCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    self.layer.borderColor = [UIColor colorWithHexString:@"#F6F6F6"].CGColor;
    self.layer.borderWidth = 0.4;
    [self addSubview:self.scrollView];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillData:(id)data
{
    if (![data isKindOfClass:[CMBorrowChooseItem class]]) {
        return;
    }
    [self.scrollView removeAllSubviews];
    self.choose = (CMBorrowChooseItem *)data;
    self.backgroundColor = [UIColor whiteColor];
    NSInteger count = [self.choose numCount];
    CGFloat width = KScreenWidth / 5;
    for (int i=0 ; i<count; i++)
    {
        NSString * itemTitle = [self.choose titleAtIndex:i];
        CMChooseItemView * itemView = [[CMChooseItemView alloc] initWithFrame:CGRectMake(width * i, 0, width, 44)];
        itemView.userInteractionEnabled = YES;
        itemView.tag = CMChooseItemTag + i;
        itemView.titleLabel.font = [UIFont systemFontOfSize:14];
        [itemView setTitle:itemTitle forState:UIControlStateNormal];
        [itemView setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [itemView setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        [itemView addTarget:self action:@selector(conditionSelected:) forControlEvents:UIControlEventTouchUpInside];
//        if (i > 0)
//        {
            if (i == [self.choose.selectValue integerValue]) {
                [itemView setStyle:CMChooseItemViewStyleSelected];
            }else{
                [itemView setStyle:CMChooseItemViewStyleNormal];
            }
//        }
       
        [self.scrollView addSubview:itemView];
    }
    self.scrollView.contentSize = CGSizeMake(width * count, 44);
}

- (void)conditionSelected:(CMChooseItemView *)view
{
    NSArray * array = [self.scrollView subviews];
    for (CMChooseItemView *item in array) {
        if ([item isKindOfClass:[CMChooseItemView class]]) {
            if (item.tag == view.tag) {
                [item setStyle:CMChooseItemViewStyleSelected];
            }else{
                [item setStyle:CMChooseItemViewStyleNormal];
            }
        }
    }
    NSInteger selectIndex = view.tag - CMChooseItemTag;
    self.choose.selectValue = (selectIndex > 0) ? [NSString stringWithFormat:@"%ld",selectIndex] : @"";
}

#pragma mark - set get
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 44)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
@end
