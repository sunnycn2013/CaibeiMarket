//
//  CMFindTableViewHeader.m
//  CaibeiMarket
//
//  Created by alibaba on 2017/11/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMFindTableViewHeader.h"
#import "CMFindItem.h"
#import "CMFindNexNoteView.h"

@interface CMFindTableViewHeader()

@property (nonatomic,strong) UIImageView * bgImageView;
//@property (nonatomic,strong) UIImageView * addImageView;
@property (nonatomic,strong) UILabel     * totoalMoneyLabel;
@property (nonatomic,strong) UILabel     * totoalMoneyTagLabel;
@property (nonatomic,strong) UIImageView * wenbenImageView;
@property (nonatomic,strong) UILabel     * numberOfMoneyLabel;
@property (nonatomic,strong) CMFindNexNoteView     * noteView;


@property (nonatomic,strong) CMFindWare  * model;

@end

@implementation CMFindTableViewHeader

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
    [self addSubview:self.bgImageView];
//    [self addSubview:self.addImageView];
    [self addSubview:self.totoalMoneyLabel];
    [self addSubview:self.totoalMoneyTagLabel];
    [self addSubview:self.wenbenImageView];
    [self addSubview:self.numberOfMoneyLabel];
    [self addSubview:self.noteView];
    
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    
//    UITapGestureRecognizer * addTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addBillAction:)];
//    [self.addImageView addGestureRecognizer:addTapGesture];
    
    
    UITapGestureRecognizer * billListGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(billListAction:)];
    [self.noteView addGestureRecognizer:billListGesture];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMFindWare class]]) {
        return;
    }
    self.model = (CMFindWare *)model;
}

- (void)addBillAction:(UITapGestureRecognizer *)ges
{
//    if ([self.delegate respondsToSelector:@selector(findHeadView:didTapedAddBill:)]) {
//        [self.delegate findHeadView:self didTapedAddBill:self.addImageView];
//    }
}

- (void)billListAction:(UITapGestureRecognizer *)ges
{
    if ([self.delegate respondsToSelector:@selector(findHeadView:didTapedBillList:)]) {
        [self.delegate findHeadView:self didTapedBillList:self.noteView];
    }
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kIPhone6Scale(242))];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.image = [UIImage imageNamed:@"find_jizhang"];
    }
    return _bgImageView;
}

//- (UIImageView *)addImageView
//{
//    if (!_addImageView) {
//        _addImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KScreenWidth - 28,kIPhone6Scale(33) ,14 , 14)];
//        _addImageView.contentMode = UIViewContentModeScaleAspectFill;
//        _addImageView.image = [UIImage imageNamed:@"find_jizhang_add"];
//        _addImageView.userInteractionEnabled = YES;
//    }
//    return _addImageView;
//}

- (UILabel *)totoalMoneyLabel
{
    if (!_totoalMoneyLabel) {
        _totoalMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kIPhone6Scale(95), KScreenWidth, kIPhone6Scale(30))];
        _totoalMoneyLabel.textAlignment = NSTextAlignmentCenter;
        _totoalMoneyLabel.font = [UIFont boldSystemFontOfSize:26];
        _totoalMoneyLabel.textColor = [UIColor colorWithHexString:@"#FDFDFD"];
        _totoalMoneyLabel.text = @"1080.0";
//        _totoalMoneyLabel.backgroundColor = [UIColor redColor];
    }
    return _totoalMoneyLabel;
}

- (UILabel *)totoalMoneyTagLabel
{
    if (!_totoalMoneyTagLabel) {
        _totoalMoneyTagLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _totoalMoneyLabel.bottom+4, kIPhone6Scale(210), kIPhone6Scale(25))];
        _totoalMoneyTagLabel.textAlignment = NSTextAlignmentRight;
        _totoalMoneyTagLabel.font = [UIFont boldSystemFontOfSize:16];
        _totoalMoneyTagLabel.textColor = [UIColor colorWithHexString:@"#FDFDFD"];
//        _totoalMoneyTagLabel.backgroundColor = [UIColor redColor];
        _totoalMoneyTagLabel.text = @"待还总额";
    }
    return _totoalMoneyTagLabel;
}

- (UIImageView *)wenbenImageView
{
    if (!_wenbenImageView) {
        _wenbenImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_totoalMoneyTagLabel.right+kIPhone6PScale(4), _totoalMoneyTagLabel.top+kIPhone6PScale(7),24 , 17)];
        _wenbenImageView.contentMode = UIViewContentModeScaleAspectFill;
        _wenbenImageView.image = [UIImage imageNamed:@"find_jizhang_benzi"];
    }
    return _wenbenImageView;
}

- (UILabel *)numberOfMoneyLabel
{
    if (!_numberOfMoneyLabel) {
        _numberOfMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _totoalMoneyLabel.bottom+kIPhone6Scale(4), kIPhone6Scale(20), kIPhone6Scale(10))];
        _numberOfMoneyLabel.textAlignment = NSTextAlignmentRight;
        _numberOfMoneyLabel.font = [UIFont boldSystemFontOfSize:10];
        _numberOfMoneyLabel.textColor = [UIColor colorWithHexString:@"#FDFDFD"];
        _numberOfMoneyLabel.text = @"6笔";
        _numberOfMoneyLabel.centerX = _wenbenImageView.centerX-kIPhone6Scale(2);
        _numberOfMoneyLabel.centerY = _wenbenImageView.centerY+kIPhone6Scale(1);
    }
    return _numberOfMoneyLabel;
}

- (CMFindNexNoteView *)noteView
{
    if (!_noteView) {
        _noteView = [[CMFindNexNoteView alloc] initWithFrame:CGRectMake(15,kIPhone6Scale(202), KScreenWidth - 30, kIPhone6Scale(80))];
        _noteView.layer.cornerRadius = 6;
        _noteView.layer.masksToBounds = YES;
        _noteView.userInteractionEnabled = YES;
    }
    return _noteView;
}

@end
