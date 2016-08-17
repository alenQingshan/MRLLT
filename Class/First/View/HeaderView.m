//
//  HeaderView.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
{
    UILabel *_nameLabel;
}
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
    UILabel *titleLabel = [MyUtil createLabelFrame:CGRectMake(0, 0, Screen_width, 40) title:@"" font:nil];
    titleLabel.font = [UIFont fontWithName:@"STSongti-SC-Regular" size:20];
    titleLabel.text = @"公告";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = Black_color;
    titleLabel.numberOfLines = [titleLabel.text length];
    [self addSubview:titleLabel];
    
    NSArray *arr = @[@"1.移动4日起进行内部修整暂时不能充值",@"2.联通自6日起开始福建即可省内充值",@"3.河北省内流量半价!!!"];
    for (int i = 0; i < arr.count; i++) {
        UILabel *sublabel = [MyUtil createLabelFrame:CGRectMake(20, 40+20*i, Screen_width-40, 20) title:@"" font:LFFont(SubTitleFont)];
        sublabel.textColor = [UIColor grayColor];
        sublabel.text = arr[i];
        if (i == 2) {
            sublabel.textColor = Black_color;
        }
        [self addSubview:sublabel];
    }
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, Screen_width, 1)];
    lineView.backgroundColor = WhiteColor;
    [self addSubview:lineView];
    
    
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(20, 130, Screen_width-70, 40) placeHolder:@"请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.font = LFFont(24);
    _userIDField.delegate = self;
    [self addSubview:_userIDField];
    
    UIImageView *userImage = [MyUtil createImageView:CGRectMake(Screen_width-50, 135, 30, 30) imageName:@"phoneUser"];
    [self addSubview:userImage];
    
    _nameLabel = [MyUtil createLabelFrame:CGRectMake(20, 170, Screen_width-40, 20) title:@"归属地" font:LFFont(TitleFont)];
    _nameLabel.textColor = [UIColor grayColor];
    [self addSubview:_nameLabel];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 190, Screen_width, 1)];
    lineView2.backgroundColor = WhiteColor;
    [self addSubview:lineView2];


    
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(_userIDField.text.length == 3){
        _userIDField.text = [NSString stringWithFormat:@"%@ ",_userIDField.text];
    }else if(_userIDField.text.length == 8){
        _userIDField.text = [NSString stringWithFormat:@"%@ ",_userIDField.text];
    }else if (_userIDField.text.length == 12){
        NSCharacterSet *csw = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        NSString *filteredw = [[string componentsSeparatedByCharactersInSet:csw] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL Change = [string isEqualToString:filteredw];
        if(Change){
            [self network:[NSString stringWithFormat:@"%@%@",_userIDField.text,string]];
        }
    }
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
    BOOL canChange = [string isEqualToString:filtered];
    return textField.text.length>=131?NO: canChange;
}

-(void)network:(NSString *)str
{
    NSString *strUrl = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    [NetWorking MobileInfo:^(NSMutableDictionary *dict) {
        _nameLabel.text = dict[@"channel_name"];
    } phoneNum:strUrl];
}

@end
