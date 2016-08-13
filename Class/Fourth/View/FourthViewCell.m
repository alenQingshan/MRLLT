//
//  FourthViewCell.m
//  MRLLT
//
//  Created by 刘青山 on 16/8/13.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "FourthViewCell.h"

@implementation FourthViewCell
{
    UILabel *_timelabel;
    UILabel *_timedetaillabel;
    UIImageView *_imageview;
    UILabel *_moneyLabel;
    UILabel *_modey_detailLabel;
    UILabel *_typeLabel;
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
    _timelabel = [MyUtil createLabelFrame:CGRectMake(10, 10, 60, 20) title:@"7-31" font:LFFont(TitleFont)];
    [self.contentView addSubview:_timelabel];
    
    _timedetaillabel = [MyUtil createLabelFrame:CGRectMake(10, 30, 60, 20) title:@"9:10" font:LFFont(TitleFont)];
    [self.contentView addSubview:_timedetaillabel];
    
    _imageview = [MyUtil createImageView:CGRectMake(80, 10, 40, 40) imageName:@"dianxin"];
    [self.contentView addSubview:_imageview];
    
    _moneyLabel = [MyUtil createLabelFrame:CGRectMake(140, 10, Screen_width-220, 20) title:@"12.5" font:LFFont(TitleFont)];
    _moneyLabel.font = LFFont(16);
    [self.contentView addSubview:_moneyLabel];
    
    _modey_detailLabel = [MyUtil createLabelFrame:CGRectMake(140, 30, Screen_width-160, 20) title:@"100M-17701849938" font:LFFont(TitleFont)];
    [self.contentView addSubview:_modey_detailLabel];
    
    _typeLabel = [MyUtil createLabelFrame:CGRectMake(Screen_width-80, 10, 60, 20) title:@"交易成功" font:LFFont(TitleFont)];
    [self.contentView addSubview:_typeLabel];
    
}

-(void)config:(NSInteger)index
{
    switch (index) {
        case 0:
            [_imageview setImage:[UIImage imageNamed:@"dianxin"]];
            break;
        case 1:
            [_imageview setImage:[UIImage imageNamed:@"yidong"]];
            break;
        case 2:
            [_imageview setImage:[UIImage imageNamed:@"liantong"]];
            break;
            
        default:
            [_imageview setImage:[UIImage imageNamed:@"liantong"]];
            break;
    }
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
