//
//  CMBorrowDetailDestCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailDesCell.h"
#import "CMBorrowDetail.h"

@interface CMBorrowDetailDesCell ()
@property (nonatomic,strong)UIView * bgView;

@property (nonatomic,strong)UIImageView * applyNoteImageView;
@property (nonatomic,strong)UILabel * applyConditionDesLabel;
@property (nonatomic,strong)UILabel * applyCondition01Label;
@property (nonatomic,strong)UILabel * applyCondition02Label;
@property (nonatomic,strong)UILabel * applyCondition03Label;

@property (nonatomic,strong)UIImageView * cerNoteImageView;
@property (nonatomic,strong)UILabel * cerConditionDesLabel;
@property (nonatomic,strong)UILabel * cerConditionLabel;

@property (nonatomic,strong)UIImageView * adviceNoteImageView;
@property (nonatomic,strong)UILabel * applyAdviceDesLabel;
@property (nonatomic,strong)UILabel * applyAdviceLabel;

@property (nonatomic,strong)UIImageView * punishmentNoteImageView;
@property (nonatomic,strong)UILabel * punishmentDesLabel;
@property (nonatomic,strong)UILabel * punishmentLabel;

@property (nonatomic,strong)CMBorrowProduct * model;
@end

@implementation CMBorrowDetailDesCell

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
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];
    [self addSubview:self.applyNoteImageView];
    [self addSubview:self.applyConditionDesLabel];
    [self addSubview:self.applyCondition01Label];
    [self addSubview:self.applyCondition02Label];
    [self addSubview:self.applyCondition03Label];

    [self addSubview:self.cerNoteImageView];
    [self addSubview:self.cerConditionDesLabel];
    [self addSubview:self.cerConditionLabel];
    
    [self addSubview:self.adviceNoteImageView];
    [self addSubview:self.applyAdviceDesLabel];
    [self addSubview:self.applyAdviceLabel];

    [self addSubview:self.punishmentNoteImageView];
    [self addSubview:self.punishmentDesLabel];
    [self addSubview:self.punishmentLabel];

//    [self addSubview:self.applyButton];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (CGFloat)heightForCell
{
    return 470.0;
}

- (void)fillData:(id)model
{
    if (![model isKindOfClass:[CMBorrowProduct class]]) {
        return;
    }
    self.model = (CMBorrowProduct *)model;
    
    [self.applyCondition01Label setText:[NSString stringWithFormat:@"1、%@",self.model.requirements]];
    [self.cerConditionLabel setText:self.model.certificationMaterials];
    [self.applyAdviceLabel setText:self.model.applyForAdvice];
    [self.punishmentLabel setText:self.model.overduePunishment];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - set get


- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 385)];
    }
    return _bgView;
}

#pragma mark - apply condition
- (UIImageView *)applyNoteImageView
{
    if (!_applyNoteImageView) {
        _applyNoteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6PScale(19), kIPhone6PScale(14), kIPhone6PScale(3), kIPhone6PScale(10))];
        _applyNoteImageView.image = [UIImage imageNamed:@"borrow_detail_head_note"];
    }
    return _applyNoteImageView;
}

- (UILabel *)applyConditionDesLabel
{
    if (!_applyConditionDesLabel) {
        _applyConditionDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(32),kIPhone6PScale(10),kIPhone6PScale(268), kIPhone6PScale(20))];
        _applyConditionDesLabel.text = @"申请条件";
        _applyConditionDesLabel.textColor = [UIColor blackColor];
        _applyConditionDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(16)];
//        _applyConditionDesLabel.backgroundColor = [UIColor purpleColor];
    }
    return _applyConditionDesLabel;
}

- (UILabel *)applyCondition01Label
{
    if (!_applyCondition01Label) {
        _applyCondition01Label = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(38), _applyConditionDesLabel.bottom, kIPhone6PScale(314), kIPhone6PScale(22))];
        _applyCondition01Label.text = @"1、19-60周岁，拥有稳定的收入来源，无不良记录";
        _applyCondition01Label.textColor = [UIColor grayColor];
        _applyCondition01Label.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _applyCondition01Label;
}

- (UILabel *)applyCondition02Label
{
    if (!_applyCondition02Label) {
        _applyCondition02Label = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(38),  _applyCondition01Label.bottom, kIPhone6PScale(314), kIPhone6PScale(22))];
        _applyCondition02Label.text = @"2、仅需实名认证，无需信用卡、无需征信报告";
        _applyCondition02Label.textColor = [UIColor grayColor];
        _applyCondition02Label.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _applyCondition02Label;
}

- (UILabel *)applyCondition03Label
{
    if (!_applyCondition03Label) {
        _applyCondition03Label = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(38),  _applyCondition02Label.bottom,kIPhone6PScale(314), kIPhone6PScale(22))];
        _applyCondition03Label.text = @"3、手机实名认证、芝麻信用授权";
        _applyCondition03Label.textColor = [UIColor grayColor];
        _applyCondition03Label.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _applyCondition03Label;
}

#pragma mark -  cer

- (UIImageView *)cerNoteImageView
{
    if (!_cerNoteImageView) {
        _cerNoteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6PScale(19), _applyCondition03Label.bottom+kIPhone6PScale(13), kIPhone6PScale(3), kIPhone6PScale(10))];
        _cerNoteImageView.image = [UIImage imageNamed:@"borrow_detail_head_note"];
    }
    return _cerNoteImageView;
}

- (UILabel *)cerConditionDesLabel
{
    if (!_cerConditionDesLabel) {
        _cerConditionDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(33), _applyCondition03Label.bottom+kIPhone6PScale(5), kIPhone6PScale(270), kIPhone6PScale(23))];
        _cerConditionDesLabel.text = @"认证材料";
        _cerConditionDesLabel.textColor = [UIColor blackColor];
        _cerConditionDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(16)];
    }
    return _cerConditionDesLabel;
}

- (UILabel *)cerConditionLabel
{
    if (!_cerConditionLabel) {
        _cerConditionLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(38), _cerConditionDesLabel.bottom, kIPhone6PScale(314), kIPhone6PScale(23))];
        _cerConditionLabel.text = @"身份证认证-银行卡认证-芝麻信用认证-运营商授权";
        _cerConditionLabel.numberOfLines = 0;
        _cerConditionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _cerConditionLabel.textColor = [UIColor grayColor];
        _cerConditionLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _cerConditionLabel;
}

#pragma mark -  advice
- (UIImageView *)adviceNoteImageView
{
    if (!_adviceNoteImageView) {
        _adviceNoteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6PScale(19), _cerConditionLabel.bottom+kIPhone6PScale(13), kIPhone6PScale(3), kIPhone6PScale(10))];
        _adviceNoteImageView.image = [UIImage imageNamed:@"borrow_detail_head_note"];
    }
    return _adviceNoteImageView;
}

- (UILabel *)applyAdviceDesLabel
{
    if (!_applyAdviceDesLabel) {
        _applyAdviceDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(33), _cerConditionLabel.bottom+kIPhone6PScale(5), kIPhone6PScale(270), kIPhone6PScale(23))];
        _applyAdviceDesLabel.text = @"申请建议";
        _applyAdviceDesLabel.textColor = [UIColor blackColor];
        _applyAdviceDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(16)];
    }
    return _applyAdviceDesLabel;
}

- (UILabel *)applyAdviceLabel
{
    if (!_applyAdviceLabel) {
        _applyAdviceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(38), _applyAdviceDesLabel.bottom+kIPhone6PScale(2), kIPhone6PScale(314), kIPhone6PScale(23))];
        _applyAdviceLabel.text = @"建议快速下载当天申请，并提交材料，该平台如果你在蚂蚁借呗借不到钱在这也借不到。";
        _applyAdviceLabel.numberOfLines = 0;
        _applyAdviceLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _applyAdviceLabel.textColor = [UIColor grayColor];
        _applyAdviceLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _applyAdviceLabel;
}

#pragma mark -  punishment

- (UIImageView *)punishmentNoteImageView
{
    if (!_punishmentNoteImageView) {
        _punishmentNoteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kIPhone6PScale(19), _applyAdviceLabel.bottom+kIPhone6PScale(13), kIPhone6PScale(3), kIPhone6PScale(10))];
        _punishmentNoteImageView.image = [UIImage imageNamed:@"borrow_detail_head_note"];
    }
    return _punishmentNoteImageView;
}

- (UILabel *)punishmentDesLabel
{
    if (!_punishmentDesLabel) {
        _punishmentDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(33), _applyAdviceLabel.bottom+kIPhone6PScale(5), kIPhone6PScale(270), kIPhone6PScale(23))];
        _punishmentDesLabel.text = @"逾期惩罚";
        _punishmentDesLabel.textColor = [UIColor blackColor];
        _punishmentDesLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(16)];
    }
    return _punishmentDesLabel;
}

- (UILabel *)punishmentLabel
{
    if (!_punishmentLabel) {
        _punishmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6PScale(38), _punishmentDesLabel.bottom, kIPhone6PScale(314), kIPhone6PScale(23))];
        _punishmentLabel.text = @"尽量不要逾期，逾期后他会2天内把你的征信信息上传给芝麻信用，会迅速减少10分，影响你的出行。";
        _punishmentLabel.numberOfLines = 0;
        _punishmentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _punishmentLabel.textColor = [UIColor grayColor];
        _punishmentLabel.font = [UIFont systemFontOfSize:kIPhone6PScale(12)];
    }
    return _punishmentLabel;
}
@end
