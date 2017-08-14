//
//  CMBorrowDetailContentCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/13.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailContentCell.h"
#import "ZZCACircleProgress.h"

@interface CMBorrowDetailContentCell ()

@property (nonatomic,strong)UILabel * totalMoneylabel;

@property (nonatomic,strong)UILabel * totalMoneyPricelabel;
@property (nonatomic,strong)ZZCACircleProgress * progressView;

@property (nonatomic,strong)UILabel * supplyNameLabel;  //供应商名字
@property (nonatomic,strong)UILabel * interestLabel;     //利率
@property (nonatomic,strong)UILabel * interestDesLabel;     //利率

@property (nonatomic,strong)UILabel * lendingTimeLabel;     //放款时间
@property (nonatomic,strong)UILabel * totalApplyDesLabel;   //审核人数
@property (nonatomic,strong)UILabel * totalApplyNumberLabel;

@property (nonatomic,strong)UILabel * todayApplyDesLabel;  //今日审核人数
@property (nonatomic,strong)UILabel * todayApplyNumberLabel;

@property (nonatomic,strong)UILabel * approveDesLabel;  //审核通过率
@property (nonatomic,strong)UILabel * approveLabel;
@end

@implementation CMBorrowDetailContentCell

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
    [self addSubview:self.totalMoneylabel];
    [self addSubview:self.totalMoneyPricelabel];
    [self addSubview:self.progressView];
    
    [self addSubview:self.supplyNameLabel];
    [self addSubview:self.interestLabel];
    [self addSubview:self.interestDesLabel];
    
    [self addSubview:self.lendingTimeLabel];
    [self addSubview:self.totalApplyDesLabel];
    [self addSubview:self.totalApplyNumberLabel];
    
    [self addSubview:self.todayApplyDesLabel];
    [self addSubview:self.todayApplyNumberLabel];
    
    [self addSubview:self.approveDesLabel];
    [self addSubview:self.approveLabel];
}


- (CGFloat)heightForCell
{
    return 175.0;
}


#pragma mark -  set get
- (UILabel *)totalMoneylabel
{
    if (!_totalMoneylabel) {
        _totalMoneylabel = [[UILabel alloc] initWithFrame:CGRectMake(71, 71, 77, 19)];
        _totalMoneylabel.text = @"1024元";
        _totalMoneylabel.font = [UIFont systemFontOfSize:16];
    }
    return _totalMoneylabel;
}

- (ZZCACircleProgress *)progressView
{
    if (!_progressView) {
        _progressView = [[ZZCACircleProgress alloc] initWithFrame:CGRectMake(40, 22, 111, 111) pathBackColor:[UIColor yellowColor] pathFillColor:CMThemeColor startAngle:0 strokeWidth:15];
        _progressView.showProgressText = NO;
        _progressView.duration = 1.0;//动画时长
        
        _progressView.prepareToShow = YES;//设置好属性，准备好显示了，显示之前必须调用一次
        _progressView.progress = 0.9;
        _progressView.showPoint = NO;
    }
    return _progressView;
}

- (UILabel *)totalMoneyPricelabel
{
    if (!_totalMoneyPricelabel) {
        _totalMoneyPricelabel = [[UILabel alloc] initWithFrame:CGRectMake(57, 142, 96, 18)];
        _totalMoneyPricelabel.text = @"每日手续费4元";
        _totalMoneyPricelabel.font = [UIFont systemFontOfSize:12];
    }
    return _totalMoneyPricelabel;
}

- (UILabel *)supplyNameLabel
{
    if (!_supplyNameLabel) {
        _supplyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(184, 18, 143, 24)];
        _supplyNameLabel.text = @"喵贷贷款";
        _supplyNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _supplyNameLabel;
}

- (UILabel *)interestLabel
{
    if (!_interestLabel) {
        _interestLabel = [[UILabel alloc] initWithFrame:CGRectMake(184, 49, 47, 17)];
        _interestLabel.text = @"月利率";
        _interestLabel.font = [UIFont systemFontOfSize:12];
    }
    return _interestLabel;
}

- (UILabel *)interestDesLabel
{
    if (!_interestDesLabel) {
        _interestDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_interestLabel.right, 49, 57, 17)];
        _interestDesLabel.text = @"0.25%月";
        _interestDesLabel.font = [UIFont systemFontOfSize:12];
    }
    return _interestDesLabel;
}

- (UILabel *)lendingTimeLabel
{
    if (!_lendingTimeLabel) {
        _lendingTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(184, 72, 160, 17)];
        _lendingTimeLabel.text = @"放款时间:1小时放款";
        _lendingTimeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _lendingTimeLabel;
}
- (UILabel *)totalApplyDesLabel
{
    if (!_totalApplyDesLabel) {
        _totalApplyDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(184, 93, 69, 17)];
        _totalApplyDesLabel.text = @"总申请人数:";
        _totalApplyDesLabel.font = [UIFont systemFontOfSize:12];
    }
    return _totalApplyDesLabel;
}

- (UILabel *)totalApplyNumberLabel
{
    if (!_totalApplyNumberLabel) {
        _totalApplyNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_totalApplyDesLabel.right, 93, 70, 17)];
        _totalApplyNumberLabel.text = @"12345";
        _totalApplyNumberLabel.font = [UIFont systemFontOfSize:12];
    }
    return _totalApplyNumberLabel;
}
//@property (nonatomic,strong)UILabel * lendingTimeLabel;     //放款时间
//@property (nonatomic,strong)UILabel * totalApplyDesLabel;   //审核人数
//@property (nonatomic,strong)UILabel * totalApplyNumberLabel;
- (UILabel *)todayApplyDesLabel
{
    if (!_todayApplyDesLabel) {
        _todayApplyDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(184, 113, 80, 17)];
        _todayApplyDesLabel.text = @"今日申请人数:";
        _todayApplyDesLabel.font = [UIFont systemFontOfSize:12];
    }
    return _todayApplyDesLabel;
}
- (UILabel *)todayApplyNumberLabel
{
    if (!_todayApplyNumberLabel) {
        _todayApplyNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_todayApplyDesLabel.right, 113, 54, 17)];
        _todayApplyNumberLabel.text = @"251";
        _todayApplyNumberLabel.textColor = CMThemeColor;
        _todayApplyNumberLabel.font = [UIFont systemFontOfSize:12];
    }
    return _todayApplyNumberLabel;
}

- (UILabel *)approveDesLabel
{
    if (!_approveDesLabel) {
        _approveDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(184, 134, 58, 17)];
        _approveDesLabel.text = @"通过率:";
        _approveDesLabel.font = [UIFont systemFontOfSize:12];
    }
    return _approveDesLabel;
}

- (UILabel *)approveLabel
{
    if (!_approveLabel) {
        _approveLabel = [[UILabel alloc] initWithFrame:CGRectMake(_approveDesLabel.right, 134, 57, 17)];
        _approveLabel.text = @"50%";
        _approveLabel.textColor = CMThemeColor;
        _approveLabel.font = [UIFont systemFontOfSize:12];
    }
    return _approveLabel;
}

//@property (nonatomic,strong)UILabel * approveDesLabel;  //审核通过率
//@property (nonatomic,strong)UILabel * approveLabel;
@end
