//
//  HeaderView.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    UILabel *titleLabel = [MyUtil createLabelFrame:CGRectMake(20, 0, 20, 100) title:@"" font:nil];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = @"公\n告";
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.numberOfLines = [titleLabel.text length];
    [self addSubview:titleLabel];
    
    NSArray *arr = @[@"1.移动4日起进行内部修整,暂时不能充值",@"2.联通自6日起开始,福建即可省内充值",@"米瑞流量通支持三大运营商充值,及时到账",@"如遇特殊情况充值不到账请您联系:13031184217"];
    for (int i = 0; i < 4; i++) {
        UILabel *sublabel = [MyUtil createLabelFrame:CGRectMake(60, 10+20*i, Screen_width-60, 20) title:@"" font:LFFont(SubTitleFont)];
        sublabel.font = LFFont(12);
        sublabel.textColor = [UIColor grayColor];
        sublabel.text = arr[i];
        [self addSubview:sublabel];
    }
    
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(20, 100, Screen_width-60, 40) placeHolder:@"请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.delegate = self;
    [self addSubview:_userIDField];
    
    UIImageView *userImage = [MyUtil createImageView:CGRectMake(Screen_width-60, 110, 30, 30) imageName:@"phoneUser"];
    [self addSubview:userImage];
    
    UILabel *nameLabel = [MyUtil createLabelFrame:CGRectMake(20, 140, Screen_width-40, 20) title:@"中国联通" font:LFFont(TitleFont)];
    nameLabel.textColor = [UIColor grayColor];
    [self addSubview:nameLabel];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - UITextField 代理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userIDField resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
