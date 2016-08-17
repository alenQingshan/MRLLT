//
//  FirstViewCell.m
//  MRLLT
//
//  Created by 刘青山 on 16/8/13.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "FirstViewCell.h"

@implementation FirstViewCell
{
    UILabel *_titleLabel;
    UITextView *_detailLabel;
    UIButton *_goumaiButton;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self crateUI];
    }
    return self;
}

-(void)crateUI
{
    _titleLabel = [MyUtil createLabelFrame:CGRectMake(15, 10, Screen_width/3*2, 20) title:@"" font:LFFont(TitleFont)];
    
    _titleLabel.font = LFFont(TitleFont);
    _titleLabel.textColor = Black_color;
    [self.contentView addSubview:_titleLabel];
    
    _detailLabel = [[UITextView alloc]initWithFrame:CGRectMake(10, 30, Screen_width/3*2, 60)];
    _detailLabel.scrollEnabled = NO;
    _detailLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_detailLabel];
    
    _goumaiButton = [MyUtil createBtnFrame:CGRectMake(Screen_width-80, 25, 60, 30) title:@"购买" backgroundColor:[UIColor whiteColor] titleColor:TintColor target:nil action:nil];
    _goumaiButton.layer.borderWidth = 1;
    _goumaiButton.layer.borderColor = [TintColor CGColor];
    [self.contentView addSubview:_goumaiButton];
    
}

-(void)firstconfig:(NSString *)title detail:(NSString *)detal
{
    _titleLabel.text = title;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:detal];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, str.length)];
    [str addAttribute:NSForegroundColorAttributeName value:TintColor range:NSMakeRange(0,4)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HiraginoSansGB-W3" size:14] range:NSMakeRange(0, str.length)];
    _detailLabel.attributedText = str;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
