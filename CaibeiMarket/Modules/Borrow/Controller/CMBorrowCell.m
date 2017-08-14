//
//  CMBorrowCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/4.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowCell.h"
#import "CMBorrow.h"

@interface CMBorrowCell ()

@property (nonatomic,strong) UIImageView * iconImageView;

@property (nonatomic,strong) UILabel * companyNameLabel;

@property (nonatomic,strong) UILabel * isCashLabel;

@property (nonatomic,strong) UILabel * isCreditLabel;

@property (nonatomic,strong) UILabel * isPromationLabel;

@property (nonatomic,strong) UILabel * applyLabel;

@property (nonatomic,strong) UILabel * applyNumLabel;

@property (nonatomic,strong) UILabel * applyInterestabelLabel; //月利率

@property (nonatomic,strong) UILabel * descriptionInfoLabel;

@property (nonatomic,strong) UILabel * borrowLinesLabel;

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
    [self addSubview:self.isCashLabel];
//    [self addSubview:self.isCreditLabel];
//    [self addSubview:self.isPromationLabel];
    [self addSubview:self.applyLabel];
    [self addSubview:self.applyNumLabel];
    [self addSubview:self.applyInterestabelLabel];
    [self addSubview:self.descriptionInfoLabel];
    [self addSubview:self.borrowLinesLabel];
    self.clipsToBounds = YES;

}

- (void)fillData:(id)model
{
    if ([model isKindOfClass:[CMBorrowCrads  class]]) {
        self.data = (CMBorrowCrads *)model;
    }
    //http://47.94.220.244:8080/screen/20170813_716.png
    NSString * imageURL = [NSString stringWithFormat:@"%@%@",URL_main,self.data.lendPicUrl];
    [self.iconImageView setImageURL:[NSURL URLWithString:imageURL]];
    [self.companyNameLabel setText:self.data.lendName];
    NSString * extend = @"%";
    [self.applyInterestabelLabel setText:[NSString stringWithFormat:@"%@%@",self.data.monthlyInterestRate,extend]];
    [self.applyNumLabel setText:[NSString stringWithFormat:@"%@",self.data.totalApply]];
//    [self.descriptionInfoLabel setText:self.data.];
}


#pragma mark - set get

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 54, 54)];
        _iconImageView.layer.cornerRadius = 10;
        _iconImageView.image = [UIImage imageNamed:@"icon-50"];
    }
    return _iconImageView;
}

- (UILabel *)companyNameLabel
{
    if (!_companyNameLabel) {
        _companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.right + 17, _iconImageView.top, 100, 17)];
        _companyNameLabel.font = [UIFont systemFontOfSize:16];
        _companyNameLabel.text = @"秒贷小额贷";
//        _companyNameLabel.backgroundColor = [UIColor redColor];
    }
    return _companyNameLabel;
}

- (UILabel *)isCashLabel
{
    if (!_isCashLabel) {
        _isCashLabel = [[UILabel alloc] initWithFrame:CGRectMake(_companyNameLabel.right + 7, _companyNameLabel.top, 36, 13)];
        _isCashLabel.font = [UIFont systemFontOfSize:9];
    }
    return _isCashLabel;
}

- (UILabel *)isCreditLabel
{
    if (!_isCreditLabel) {
        _isCreditLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 17, 19, 85)];
        _isCreditLabel.font = [UIFont systemFontOfSize:9];
    }
    return _isCreditLabel;
}



- (UILabel *)isPromationLabel
{
    if (!_isPromationLabel) {
        _isPromationLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 17, 19, 85)];
        _isPromationLabel.font = [UIFont systemFontOfSize:9];
    }
    return _isPromationLabel;
}

- (UILabel *)applyLabel
{
    if (!_applyLabel) {
        _applyLabel = [[UILabel alloc] initWithFrame:CGRectMake(_companyNameLabel.left, _companyNameLabel.bottom + 7, 52, 14)];
        _applyLabel.font = [UIFont systemFontOfSize:9];
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
        _applyNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(_applyLabel.right, _applyLabel.top, 70, _applyLabel.height)];
        _applyNumLabel.font = [UIFont systemFontOfSize:9];
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
        _applyInterestabelLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, _applyNumLabel.top, labelWidth, 15)];
        _applyInterestabelLabel.font = [UIFont systemFontOfSize:9];
        _applyInterestabelLabel.textColor = [UIColor redColor];
        _applyInterestabelLabel.text = @"0.5元/月";
        _applyInterestabelLabel.textAlignment = NSTextAlignmentRight;
    }
    return _applyInterestabelLabel;
}

- (UILabel *)descriptionInfoLabel
{
    if (!_descriptionInfoLabel) {
        _descriptionInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(_companyNameLabel.left, _applyLabel.bottom + 4, 151, 15)];
        _descriptionInfoLabel.font = [UIFont systemFontOfSize:9];
        _descriptionInfoLabel.text = @"全新平台,活动推广中,秒批";
        _descriptionInfoLabel.textColor = [UIColor lightGrayColor];
//        _descriptionInfoLabel.backgroundColor = [UIColor greenColor];
    }
    return _descriptionInfoLabel;
}

- (UILabel *)borrowLinesLabel
{
    if (!_borrowLinesLabel) {
        CGFloat marginRight = 15;
        CGFloat labelWidth = 117;
        
        CGFloat originX = KScreenWidth- marginRight -labelWidth;
        _borrowLinesLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, _descriptionInfoLabel.top, labelWidth, 12)];
        _borrowLinesLabel.font = [UIFont systemFontOfSize:9];
        _borrowLinesLabel.textColor = [UIColor lightGrayColor];
        _borrowLinesLabel.text = @"额度: 500-5000元";
        _borrowLinesLabel.textAlignment = NSTextAlignmentRight;
    }
    return _borrowLinesLabel;
}
@end
