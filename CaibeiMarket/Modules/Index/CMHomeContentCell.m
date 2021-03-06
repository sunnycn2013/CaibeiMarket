//
//  CMHomeContentCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/21.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMHomeContentCell.h"
#import "CMHomeContentCorverFlowView.h"
#import "CMTextFieldView.h"
#import "CMHomeModel.h"
#import "CMHomeContent.h"

@interface CMHomeContentCell ()

//@property (nonatomic,strong) UIView * textFiledBgView;
//@property (nonatomic,strong) UITextField * borrowTextFiled;
@property (nonatomic,strong) CMTextFieldView * borrowTextFiled;

@property (nonatomic,strong) CMHomeContentCorverFlowView * corverFlow;
@property (nonatomic,strong) UILabel * recentLendingLabel; //  最近借款人
@property (nonatomic,strong) UIButton * borrowButton;
@property (nonatomic,strong) UILabel * borrowDes01Label; //已经服务多少人
@property (nonatomic,strong) UILabel * borrowDes02Label; //累计服务多少额度
@property (nonatomic,strong) CMHomeInfo * homeInfo;
@property (nonatomic,strong) CMHomeContent * content;

@end

@implementation CMHomeContentCell
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
    self.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self addSubview:self.borrowTextFiled];

    [self addSubview:self.corverFlow];
    [self addSubview:self.recentLendingLabel];
    [self addSubview:self.borrowButton];
    [self addSubview:self.borrowDes01Label];
    [self addSubview:self.borrowDes02Label];
}

- (void)applyOrder:(UIButton *)button
{
    self.content.totalMoney = self.borrowTextFiled.text;
    if (self.tapBlock) {
        self.tapBlock(self.content);
    }
}

- (void)fillData:(id)model
{
    self.homeInfo = model;
    CMHomeContent  * content = [CMHomeContent new];
    content.actionType = CMHomeActionTypeContent;
    self.content = content;
    //07-07 12:12 137*****000的用户借款成功1000元
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[self.homeInfo.createDate doubleValue]/1000];
    NSString * dateStr = [date description];
    if ([dateStr length] > 10) {
        NSString * placeholder = @"的用户借款成功";
        NSString * subDatestr = [NSString stringWithFormat:@"%@  ",[dateStr substringWithRange:NSMakeRange(0, 10)]];
        NSString * lengingText = [NSString stringWithFormat:@"%@%@%@%@元",subDatestr,self.homeInfo.phone,placeholder,self.homeInfo.totalLendMoney];
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:lengingText];
        NSInteger phoneStartIndex = subDatestr.length;
        NSInteger phoneLength = self.homeInfo.phone.length;
        NSInteger lendMoneyStartIndex = subDatestr.length + placeholder.length + self.homeInfo.phone.length;
        NSInteger lendMoneyLength = self.homeInfo.totalLendMoney.length;

        if(subDatestr.length > 0 && self.homeInfo.phone.length > 0 && self.homeInfo.totalLendMoney.length >0)
        {
            [attrStr addAttribute:NSForegroundColorAttributeName value:CMThemeColor range:NSMakeRange(phoneStartIndex,phoneLength)];
            [attrStr addAttribute:NSForegroundColorAttributeName value:CMThemeColor range:NSMakeRange(lendMoneyStartIndex,lendMoneyLength)];
            [self.recentLendingLabel setAttributedText:attrStr];
        }
    }
    
    NSString * servicePeople = self.homeInfo.servicePersonTime;
    NSString * totalLendMoney = self.homeInfo.totalLendMoney;
    if (servicePeople.length > 0) {
        NSString * serviceStr = [NSString stringWithFormat:@"已服务%@人完成借款",servicePeople];
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:serviceStr];
        NSInteger start = 3;
        NSInteger length = servicePeople.length;
        [attrStr addAttribute:NSForegroundColorAttributeName value:CMThemeColor range:NSMakeRange(start,length)];
        [self.borrowDes01Label setAttributedText:attrStr];
    }

    if (totalLendMoney.length > 0) {
        NSString * moneyStr = [NSString stringWithFormat:@"累计额度%@",totalLendMoney];
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:moneyStr];
        NSInteger start = 3;
        NSInteger length = totalLendMoney.length;
        [attrStr addAttribute:NSForegroundColorAttributeName value:CMThemeColor range:NSMakeRange(start,length)];
        [self.borrowDes02Label setAttributedText:attrStr];
    }
//   _borrowDes01Label.text = @"已服务2,146人完成借款";
//    _borrowDes02Label.text = @"累计额度312,480,678";

}

#pragma mark - set get

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(contentDidBeginEditing:description:)]) {
        [self.delegate contentDidBeginEditing:self description:nil];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(contentShouldReturn:value:)]) {
        [self.delegate contentShouldReturn:self value:nil];
    }
    return YES;

}

#pragma mark - set get
- (CMTextFieldView *)borrowTextFiled
{
    if (!_borrowTextFiled)
    {
        CGFloat width = (KScreenWidth - kIPhone6Scale(148));
        _borrowTextFiled = [[CMTextFieldView alloc] initWithFrame:CGRectMake(kIPhone6Scale(148)/2, kIPhone6Scale(33), width, kIPhone6Scale(45))];
        _borrowTextFiled.backgroundColor = [UIColor whiteColor];
        _borrowTextFiled.placeholder = @"输入借款额度";
        _borrowTextFiled.delegate = self;
        _borrowTextFiled.keyboardType = UIKeyboardTypeNumberPad;
        _borrowTextFiled.layer.borderWidth = 0.5;
        _borrowTextFiled.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _borrowTextFiled;
}

- (CMHomeContentCorverFlowView *)corverFlow
{
    if (!_corverFlow) {
        _corverFlow = [[CMHomeContentCorverFlowView alloc] initWithFrame:CGRectMake(0, _borrowTextFiled.bottom+24, KScreenWidth, kIPhone6Scale(58))];
    }
    return _corverFlow;
}

- (UILabel *)recentLendingLabel
{
    if (!_recentLendingLabel) {
        _recentLendingLabel = [[UILabel alloc] initWithFrame:CGRectMake(kIPhone6Scale(45), _corverFlow.bottom+ kIPhone6Scale(15), kIPhone6Scale(285), kIPhone6Scale(25))];
        _recentLendingLabel.text = @"07-07 12:12 137*****000的用户借款成功1000元";
        _recentLendingLabel.font = [UIFont systemFontOfSize:12];
    }
    return _recentLendingLabel;
}

- (UIButton *)borrowButton
{
    if (!_borrowButton) {
        CGFloat width = (KScreenWidth - kIPhone6Scale(148));
        _borrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _borrowButton.frame = CGRectMake(kIPhone6Scale(148)/2, _recentLendingLabel.bottom+kIPhone6Scale(33), width, kIPhone6Scale(45));
        _borrowButton.backgroundColor = CMThemeColor;
        _borrowButton.layer.cornerRadius = kIPhone6Scale(45)/2;
        [_borrowButton setTitle:@"申请借款" forState:UIControlStateNormal];
        [_borrowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_borrowButton addTarget:self action:@selector(applyOrder:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _borrowButton;
}

- (UILabel *)borrowDes01Label
{
    if (!_borrowDes01Label) {
        CGFloat width = (KScreenWidth - kIPhone6Scale(148));
        CGFloat margin = (KScreenWidth - width) / 2.0;
        _borrowDes01Label = [[UILabel alloc] initWithFrame:CGRectMake(margin, _borrowButton.bottom + kIPhone6Scale(18), width, kIPhone6Scale(20))];
        _borrowDes01Label.text = @"已服务2,146人完成借款";
        _borrowDes01Label.font = [UIFont systemFontOfSize:12];
        _borrowDes01Label.textAlignment = NSTextAlignmentCenter;

    }
    return _borrowDes01Label;
}

- (UILabel *)borrowDes02Label
{
    if (!_borrowDes02Label) {
        CGFloat width = (KScreenWidth - kIPhone6Scale(148));
        CGFloat margin = (KScreenWidth - width) / 2.0;
        _borrowDes02Label = [[UILabel alloc] initWithFrame:CGRectMake(margin,_borrowDes01Label.bottom, width, kIPhone6Scale(20))];
        _borrowDes02Label.text = @"累计额度312,480,678";
        _borrowDes02Label.font = [UIFont systemFontOfSize:12];
        _borrowDes02Label.textAlignment = NSTextAlignmentCenter;
    }
    return _borrowDes02Label;
}

@end
