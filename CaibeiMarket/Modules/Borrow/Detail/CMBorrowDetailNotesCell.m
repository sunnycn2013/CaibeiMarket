//
//  CMBorrowDetailNotesCell.m
//  CaibeiMarket
//
//  Created by icaibei on 2017/8/14.
//  Copyright © 2017年 qianji. All rights reserved.
//

#import "CMBorrowDetailNotesCell.h"
#import "CMBorrowDetail.h"

@interface CMBorrowDetailNotesCell ()
@property (nonatomic,strong)UIImageView * notesImageView;

@property (nonatomic,strong)UILabel * totalMoneylabel;
@property (nonatomic,strong)UILabel * totalMoneyDeslabel;

@property (nonatomic,strong)UILabel * cashBacklabel;
@property (nonatomic,strong)UILabel * cashBackDeslabel;
@property (nonatomic,strong)CMBorrowProduct * model;

@end

@implementation CMBorrowDetailNotesCell

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

    [self addSubview:self.notesImageView];
    [self addSubview:self.totalMoneylabel];
    [self addSubview:self.totalMoneyDeslabel];
    [self addSubview:self.cashBacklabel];
    [self addSubview:self.cashBackDeslabel];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (CGFloat)heightForCell
{
    return 67.0;
}

- (void)fillData:(id)model
{
    if ([model isKindOfClass:[CMBorrowProduct  class]]) {
        self.model = (CMBorrowProduct *)model;
    }
    [self.totalMoneylabel setText:[NSString stringWithFormat:@"%@",self.model.totalApply]];
    [self.cashBacklabel setText:[NSString stringWithFormat:@"%@天",self.model.loanTime]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - set get
- (UIImageView *)notesImageView
{
    if (!_notesImageView) {
        _notesImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 26, 25)];
        _notesImageView.image = [UIImage imageNamed:@"borrow_note_icon"];
    }
    return _notesImageView;
}

- (UILabel *)totalMoneylabel
{
    if (!_totalMoneylabel) {
        _totalMoneylabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 12, 34, 23)];
        _totalMoneylabel.text = @"5元";
        _totalMoneylabel.textColor = [UIColor redColor];
        _totalMoneylabel.font = [UIFont systemFontOfSize:16];
    }
    return _totalMoneylabel;
}

- (UILabel *)totalMoneyDeslabel
{
    if (!_totalMoneyDeslabel) {
        _totalMoneyDeslabel = [[UILabel alloc] initWithFrame:CGRectMake(58, 37, 132, 15)];
        _totalMoneyDeslabel.text = @"上传带宽截图成功送话费";
        _totalMoneyDeslabel.font = [UIFont systemFontOfSize:12];
    }
    return _totalMoneyDeslabel;
}

- (UILabel *)cashBacklabel
{
    if (!_cashBacklabel) {
        _cashBacklabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth - 128, 16, 28, 16)];
        _cashBacklabel.text = @"3天";
        _cashBacklabel.font = [UIFont systemFontOfSize:12];
    }
    return _cashBacklabel;
}

- (UILabel *)cashBackDeslabel
{
    if (!_cashBackDeslabel) {
        _cashBackDeslabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth - 136, 37, 55, 16)];
        _cashBackDeslabel.text = @"审核时间";
        _cashBackDeslabel.font = [UIFont systemFontOfSize:12];
    }
    return _cashBackDeslabel;
}

@end
