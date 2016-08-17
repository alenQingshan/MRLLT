//
//  HeaderFourthView.m
//  MRLLT
//
//  Created by 刘青山 on 16/8/13.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "HeaderFourthView.h"

@implementation HeaderFourthView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    
    UILabel *label = [MyUtil createLabelFrame:CGRectMake(15, 0, 65, 40) title:@"本月" font:LFFont(TitleFont)];
    label.font = LFFont(16);
    label.textColor = Black_color;
    [self addSubview:label];
    
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(80, 3, Screen_width-100, 34)];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 4;
    whiteView.layer.masksToBounds = YES;
    [self addSubview:whiteView];
    
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(0, 0, Screen_width-130, 34) placeHolder:@"    请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.delegate = self;
    [whiteView addSubview:_userIDField];
    
//    UIImageView *userImage = [MyUtil createImageView:CGRectMake(20, 5, 30, 30) imageName:@"phoneUser"];
//    [self addSubview:userImage];
    
    UIButton *searchbuttom = [MyUtil createBtnFrame:CGRectMake(Screen_width-130, 2, 30, 30) title:@"" backgroundColor:nil titleColor:nil target:self action:@selector(search)];
    [searchbuttom setBackgroundImage:[UIImage imageNamed:@"abc_ic_search_api_mtrl_alpha"] forState:UIControlStateNormal];
    [whiteView addSubview:searchbuttom];
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)search{

}

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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
