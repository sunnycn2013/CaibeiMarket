//
//  CMBorrowCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowCell.h"
#import "CMBorrow.h"
#import "CMBorrwoStarView.h"

@interface CMBorrowCell ()

@property (nonatomic,strong) UIImageView * iconImageView;

@property (nonatomic,strong) UILabel * companyNameLabel;

@property (nonatomic,strong) CMBorrwoStarView * starImageView;

@property (nonatomic,strong) UILabel * isCashLabel;

@property (nonatomic,strong) UILabel * isCreditLabel;

@property (nonatomic,strong) UILabel * isPromationLabel;

@property (nonatomic,strong) UILabel * applyLabel;

@property (nonatomic,strong) UILabel * applyNumLabel;

@property (nonatomic,strong) UILabel * applyInterestabelLabel; //月利率

@property (nonatomic,strong) UILabel * descriptionInfoLabel;

@property (nonatomic,strong) UILabel * borrowLinesLabel;

@property (nonatomic,strong) UIView  * linesView;

@property (nonatomic,strong) CMBorrowCrads * data;

@end

@implementation CMBorrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.companyNameLabel];
    [self addSubview:self.starImageView];
    [self addSubview:self.isCashLabel];
//    [self addSubview:self.isCreditLabel];
//    [self addSubview:self.isPromationLabel];
    [self addSubview:self.applyLabel];
    [self addSubview:self.applyNumLabel];
    [self addSubview:self.applyInterestabelLabel];
    [self addSubview:self.descriptionInfoLabel];
    [self addSubview:self.borrowLinesLabel];
    [self addSubview:self.linesView];
    self.clipsToBounds = YES;

}

- (void)fillData:(id)model
{
    if ([model isKindOfClass:[CMBorrowCrads  class]]) {
        self.data = (CMBorrowCrads *)model;
    }
    //http://47.94.220.244:8080/screen/20170813_716.png
    NSString * imageURL = [NSString stringWithFormat:@"%@%@",URL_IMG_main,self.data.lendPicUrl];
    [self.iconImageView setImageWithURL:[NSURL URLWithString:imageURL] placeholder:[UIImage imageNamed:@"icaibei_placeholder"]];
    [self.companyNameLabel setText:self.data.lendName];
    [self.applyInterestabelLabel setText:[NSString stringWithFormat:@"%@",self.data.monthlyInterestRate]];
    [self.applyNumLabel setText:[NSString stringWithFormat:@"%@",self.data.totalApply]];
    [self.starImageView setHidden:(!self.data.showStar)];
    [self.starImageView updateTitle:[NSString stringWithFormat:@"%ld",self.data.index + 1]];
}

#pragma mark - set get

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6PScale(25), kIPhone6PScale(15), kIPhone6PScale(54), kIPhone6PScale(54))];
        _iconImageView.layer.cornerRadius = kIPhone6PScale(10);
        _iconImageView.image = [UIImage imageNamed:@"icon-50"];
    }
    return _iconImageView;
}

- (UILabel *)companyNameLabel
{
    if (!_companyNameLabel) {
        _companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + kIPhone6PScale(17), _iconImageView.top, kIPhone6PScale(180), kIPhone6PScale(17))];
        _companyNameLabel.font = [UIFont boldSystemFontOfSize:kIPhone6Scale(15)];
        _companyNameLabel.text = @"秒贷小额贷";
    }
    return _companyNameLabel;
}

- (CMBorrwoStarView *)starImageView
{
    if (!_starImageView) {
        _starImageView = [[CMBorrwoStarView alloc] initWithFrame:CGRectMake(KScreenWidth - kIPhone6PScale(35), 0, kIPhone6PScale(16), kIPhone6PScale(17))];
    }
    return _starImageView;
}

- (UILabel *)isCashLabel
{
    if (!_isCashLabel) {
        _isCashLabel = [[UILabel alloc] initWithFrame:CGRectMake(_companyNameLabel.right + kIPhone6PScale(7), _companyNameLabel.top, kIPhone6PScale(36), kIPhone6PScale(13))];
        _isCashLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(9)];
    }
    return _isCashLabel;
}

- (UILabel *)isCreditLabel
{
    if (!_isCreditLabel) {
        _isCreditLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(17), kIPhone6PScale(17), kIPhone6PScale(19), kIPhone6PScale(85))];
        _isCreditLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(9)];
    }
    return _isCreditLabel;
}


- (UILabel *)isPromationLabel
{
    if (!_isPromationLabel) {
        _isPromationLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(17), kIPhone6PScale(17), kIPhone6PScale(19), kIPhone6PScale(85))];
        _isPromationLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(9)];
    }
    return _isPromationLabel;
}

- (UILabel *)applyLabel
{
    if (!_applyLabel) {
        _applyLabel = [[UILabel alloc] initWithFrame:CGRectMake(_companyNameLabel.left, _companyNameLabel.bottom + kIPhone6PScale(7), kIPhone6PScale(62), kIPhone6PScale(14))];
        _applyLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _applyLabel.text = @"申请人数:";
        _applyLabel.font = [UIFont systemFontOfSize:10];
        _applyLabel.textColor = [UIColor lightGrayColor];
//        _applyLabel.backgroundColor = [UIColor purpleColor];
    }
    return _applyLabel;
}

- (UILabel *)applyNumLabel
{
    if (!_applyNumLabel) {
        _applyNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(_applyLabel.right, _applyLabel.top, kIPhone6PScale(70), _applyLabel.height)];
        _applyNumLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _applyNumLabel.text = @"14028:";
        _applyNumLabel.textColor = [UIColor lightGrayColor];
    }
    return _applyNumLabel;
}

- (UILabel *)applyInterestabelLabel
{
    if (!_applyInterestabelLabel) {
        CGFloat marginRight = 15;
        CGFloat labelWidth = 58;
        
        CGFloat originX = KScreenWidth- marginRight -labelWidth;
        _applyInterestabelLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, _applyNumLabel.top, labelWidth, kIPhone6PScale(15))];
        _applyInterestabelLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(10)];
        _applyInterestabelLabel.textColor = [UIColor redColor];
        _applyInterestabelLabel.text = @"月利率：0.5元/月";
        _applyInterestabelLabel.textAlignment = NSTextAlignmentRight;
    }
    return _applyInterestabelLabel;
}

- (UILabel *)descriptionInfoLabel
{
    if (!_descriptionInfoLabel) {
        _descriptionInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_companyNameLabel.left, _applyLabel.bottom + kIPhone6PScale(4), kIPhone6PScale(151), kIPhone6PScale(15))];
        _descriptionInfoLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(9)];
        _descriptionInfoLabel.text = @"全新平台,活动推广中,秒批";
        _descriptionInfoLabel.textColor = [UIColor lightGrayColor];
//        _descriptionInfoLabel.backgroundColor = [UIColor greenColor];
    }
    return _descriptionInfoLabel;
}

- (UILabel *)borrowLinesLabel
{
    if (!_borrowLinesLabel) {
        CGFloat marginRight = kIPhone6PScale(15);
        CGFloat labelWidth = kIPhone6PScale(97);
        
        CGFloat originX = KScreenWidth- marginRight -labelWidth;
        _borrowLinesLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, _descriptionInfoLabel.top, labelWidth, 12)];
        _borrowLinesLabel.font = [UIFont systemFontOfSize:kIPhone6Scale(11)];
        _borrowLinesLabel.textColor = [UIColor lightGrayColor];
        _borrowLinesLabel.text = @"额度: 500-5000元";
        _borrowLinesLabel.textAlignment = NSTextAlignmentRight;
        _borrowLinesLabel.adjustsFontSizeToFitWidth = YES;
//        _borrowLinesLabel.backgroundColor = [UIColor redColor];
    }
    return _borrowLinesLabel;
}

- (UIView *)linesView
{
    if (!_linesView) {
        _linesView = [[UIView alloc] initWithFrame:CGRectMake(0,kIPhone6PScale(87), KScreenWidth, kIPhone6PScale(3))];
        _linesView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    }
    return _linesView;
}


@end
