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
    UILabel *_detailLabel;
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
    _titleLabel = [MyUtil createLabelFrame:CGRectMake(20, 0, Screen_width/3*2, 30) title:@"" font:LFFont(TitleFont)];
    _titleLabel.textColor = TintColor;
    [self.contentView addSubview:_titleLabel];
    _detailLabel = [MyUtil createLabelFrame:CGRectMake(20, 30, Screen_width/3*2, 60) title:@"" font:LFFont(TitleFont)];
    _detailLabel.numberOfLines = 0;
    [self.contentView addSubview:_detailLabel];
    
    _goumaiButton = [MyUtil createBtnFrame:CGRectMake(Screen_width-80, 45, 60, 30) title:@"购买" backgroundColor:[UIColor whiteColor] titleColor:TintColor target:nil action:nil];
    _goumaiButton.layer.borderWidth = 1;
    _goumaiButton.layer.borderColor = [TintColor CGColor];
    [self.contentView addSubview:_goumaiButton];
    
    
}

-(void)config:(NSString *)title detail:(NSString *)detal
{
    _titleLabel.text = title;
    _detailLabel.text = detal;
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
