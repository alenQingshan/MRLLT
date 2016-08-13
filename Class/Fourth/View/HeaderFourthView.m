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
        self.backgroundColor = [UIColor whiteColor];
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(20, 0, Screen_width-80, 40) placeHolder:@"请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.delegate = self;
    [self addSubview:_userIDField];
    
//    UIImageView *userImage = [MyUtil createImageView:CGRectMake(20, 5, 30, 30) imageName:@"phoneUser"];
//    [self addSubview:userImage];
    
    UIButton *searchbuttom = [MyUtil createBtnFrame:CGRectMake(Screen_width-60, 5, 30, 30) title:@"" backgroundColor:nil titleColor:nil target:self action:@selector(search)];
    [searchbuttom setBackgroundImage:[UIImage imageNamed:@"abc_ic_search_api_mtrl_alpha"] forState:UIControlStateNormal];
    [self addSubview:searchbuttom];
    
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
