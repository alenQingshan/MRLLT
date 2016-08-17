//
//  SecondViewCell.m
//  MRLLT
//
//  Created by 刘青山 on 16/8/17.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "SecondViewCell.h"

@implementation SecondViewCell
{
    UILabel *_titleLabel;
    UILabel *_detailLabel;
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
    _titleLabel = [MyUtil createLabelFrame:CGRectMake(30, 10, Screen_width-60, 20) title:@"" font:LFFont(TitleFont)];
    
    _titleLabel.font = LFFont(16);
    _titleLabel.textColor = Black_color;
    [self.contentView addSubview:_titleLabel];
    
    _detailLabel = [MyUtil createLabelFrame:CGRectMake(30, 30, Screen_width-60, 20) title:@"" font:LFFont(TitleFont)];
    _detailLabel.font = LFFont(14);
    _detailLabel.textColor = [UIColor grayColor];
    _detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _detailLabel.numberOfLines = 0;
    [self.contentView addSubview:_detailLabel];
    
}

-(void)secondconfig:(NSString *)title detail:(NSString *)detal
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
