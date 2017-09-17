//
//  CMBorrowDetailContentCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/13.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailContentCell.h"
#import "ZZCACircleProgress.h"
#import "CMBorrowDetail.h"

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

@property (nonatomic,strong)CMBorrowProduct * model;

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;

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

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMBorrowProduct class]]) {
        return;
    }
    self.model = (CMBorrowProduct *)model;

    [self.totalMoneylabel setText:[NSString stringWithFormat:@"%@元",self.model.lendMoney?:@"0"]];
    [self.totalMoneyPricelabel setText:[NSString stringWithFormat:@"每日手续费%@元",self.model.lendPeriod]];
    [self.supplyNameLabel setText:self.model.lendName ? : @"喵贷贷款"];
    [self.lendingTimeLabel setText:[NSString stringWithFormat:@"放款时间: %@小时放款",self.model.loanTime]];
    [self.totalApplyNumberLabel setText:[NSString stringWithFormat:@"%@人已经申请",self.model.totalApply]];
    [self.interestDesLabel setText:self.model.monthlyInterestRate];
    [self.approveLabel setText:[NSString stringWithFormat:@"%@",self.model.throughputRate]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.totalMoneylabel.center = self.progressView.center;
}
#pragma mark -  set get
- (UILabel *)totalMoneylabel
{
    if (!_totalMoneylabel) {
        _totalMoneylabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(71), kIPhone6PScale(71), kIPhone6PScale(52), (19))];
        _totalMoneylabel.text = @"1024元";
        _totalMoneylabel.font = [UIFont systemFontOfSize:kIPhone6PScale(18)];
        _totalMoneylabel.textColor = CMThemeColor;
//        _totalMoneylabel.backgroundColor = CMThemeColor;
        _totalMoneylabel.textAlignment = NSTextAlignmentCenter;
    }
    return _totalMoneylabel;
}

- (ZZCACircleProgress *)progressView
{
    if (!_progressView) {
        _progressView = [[ZZCACircleProgress alloc] initWithFrame:CGRectMake(kIPhone6PScale(40), kIPhone6PScale(22), kIPhone6PScale(108),kIPhone6PScale(111)) pathBackColor:[UIColor yellowColor] pathFillColor:CMThemeColor startAngle:0 strokeWidth:15];
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
        _totalMoneyPricelabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(57), kIPhone6PScale(142),kIPhone6PScale(96),kIPhone6PScale(18))];
        _totalMoneyPricelabel.text = @"每日手续费4元";
        _totalMoneyPricelabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _totalMoneyPricelabel;
}

- (UILabel *)supplyNameLabel
{
    if (!_supplyNameLabel) {
        _supplyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(184), kIPhone6PScale(22), kIPhone6PScale(143), kIPhone6PScale(24))];
        _supplyNameLabel.text = @"喵贷贷款";
        _supplyNameLabel.font = [UIFont systemFontOfSize:14];
//        _supplyNameLabel.backgroundColor = [UIColor redColor];
    }
    return _supplyNameLabel;
}

- (UILabel *)interestLabel
{
    if (!_interestLabel) {
        _interestLabel = [[UILabel alloc] initWithFrame:CGRectMake(_supplyNameLabel.left, kIPhone6PScale(49), kIPhone6PScale(44), kIPhone6PScale(17))];
        _interestLabel.text = @"月利率:";
        _interestLabel.backgroundColor = [UIColor clearColor];
        _interestLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _interestLabel;
}

- (UILabel *)interestDesLabel
{
    if (!_interestDesLabel) {
        _interestDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_interestLabel.right, kIPhone6PScale(49), kIPhone6PScale(157), kIPhone6PScale(17))];
//        _interestDesLabel.text = @"0.25%月";
        _interestDesLabel.textAlignment = NSTextAlignmentLeft;
        _interestDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _interestDesLabel;
}

- (UILabel *)lendingTimeLabel
{
    if (!_lendingTimeLabel) {
        _lendingTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_supplyNameLabel.left, kIPhone6PScale(72), kIPhone6PScale(200), kIPhone6PScale(17))];
        _lendingTimeLabel.text = @"放款时间:1小时放款";
        _lendingTimeLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
//        _lendingTimeLabel.backgroundColor = [UIColor redColor];
    }
    return _lendingTimeLabel;
}
- (UILabel *)totalApplyDesLabel
{
    if (!_totalApplyDesLabel) {
        _totalApplyDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_supplyNameLabel.left, kIPhone6PScale(93), kIPhone6PScale(69), kIPhone6PScale(17))];
        _totalApplyDesLabel.text = @"总申请人数:";
        _totalApplyDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _totalApplyDesLabel;
}

- (UILabel *)totalApplyNumberLabel
{
    if (!_totalApplyNumberLabel) {
        _totalApplyNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_totalApplyDesLabel.right, kIPhone6PScale(93), kIPhone6PScale(170), kIPhone6PScale(17))];
        _totalApplyNumberLabel.text = @"12345";
        _totalApplyNumberLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _totalApplyNumberLabel;
}
//@property (nonatomic,strong)UILabel * lendingTimeLabel;     //放款时间
//@property (nonatomic,strong)UILabel * totalApplyDesLabel;   //审核人数
//@property (nonatomic,strong)UILabel * totalApplyNumberLabel;
- (UILabel *)todayApplyDesLabel
{
    if (!_todayApplyDesLabel) {
        _todayApplyDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_supplyNameLabel.left, kIPhone6PScale(113), kIPhone6PScale(80), kIPhone6PScale(17))];
        _todayApplyDesLabel.text = @"今日申请人数:";
        _todayApplyDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _todayApplyDesLabel;
}
- (UILabel *)todayApplyNumberLabel
{
    if (!_todayApplyNumberLabel) {
        _todayApplyNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(_todayApplyDesLabel.right,kIPhone6PScale(113), kIPhone6PScale(54), kIPhone6PScale(17))];
        _todayApplyNumberLabel.text = @"251";
        _todayApplyNumberLabel.textColor = CMThemeColor;
        _todayApplyNumberLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _todayApplyNumberLabel;
}

- (UILabel *)approveDesLabel
{
    if (!_approveDesLabel) {
        _approveDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(_supplyNameLabel.left, kIPhone6PScale(134), kIPhone6PScale(44), kIPhone6PScale(17))];
        _approveDesLabel.text = @"通过率:";
        _approveDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _approveDesLabel;
}

- (UILabel *)approveLabel
{
    if (!_approveLabel) {
        _approveLabel = [[UILabel alloc] initWithFrame:CGRectMake(_approveDesLabel.right, kIPhone6PScale(134), kIPhone6PScale(57), kIPhone6PScale(17))];
        _approveLabel.text = @"50%";
        _approveLabel.textColor = CMThemeColor;
        _approveLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _approveLabel;
}
@end
