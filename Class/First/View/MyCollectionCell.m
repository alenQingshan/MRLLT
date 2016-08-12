//
//  MyCollectionCell.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/8.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MyCollectionCell.h"

@interface MyCollectionCell()
{
    UILabel *_fontawesomeLabel;
    UILabel *_nameLabel;
}

@end
@implementation MyCollectionCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    _nameLabel = [MyUtil createLabelFrame:self.bounds title:@"" font:LFFont(TitleFont)];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_nameLabel];

}

-(void)config:(NSString *)name index:(NSInteger)idx
{
    switch (idx) {
        case 0:
            _nameLabel.text = @"20M";
            break;
        case 1:
            _nameLabel.text = @"50M";
            break;
        case 2:
            _nameLabel.text = @"100M";
            break;
        case 3:
            _nameLabel.text = @"200M";
            break;
        case 4:
            _nameLabel.text = @"500M";
            break;
        case 5:
            _nameLabel.text = @"1000M";
            break;
            
        default:
            break;
    }

}

@end
