//
//  LoginView.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView 


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WhiteColor;
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    UIImageView *titleimage = [MyUtil createImageView:CGRectMake((Screen_width-80)/2, 20, 80, 80) imageName:@"login"];
    [self addSubview:titleimage];

    
    UIView *userback = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(titleimage.frame)+20, Screen_width-20, 44)];
    userback.backgroundColor = [UIColor whiteColor];
    userback.layer.borderWidth = 1;
    userback.layer.borderColor = [[UIColor grayColor] CGColor];
    [self addSubview:userback];
    
    UIView *passBack = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(userback.frame)+10, Screen_width-20, 44)];
    passBack.backgroundColor = [UIColor whiteColor];
    passBack.layer.borderWidth = 1;
    passBack.layer.borderColor = [[UIColor grayColor] CGColor];
    [self addSubview:passBack];
    
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width-64, 44) placeHolder:@"请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.delegate = self;
    [userback addSubview:_userIDField];
    
    UIImageView *userimage = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_invitation_code"];
    [userback addSubview:userimage];
    
    _passwordField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width-64, 44) placeHolder:@"6-16字符,区分大小写,非纯数字" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _passwordField.delegate = self;
    [passBack addSubview:_passwordField];
    
    UIImageView *password = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_password"];
    [passBack addSubview:password];
    
    UIButton *rememberButton = [MyUtil createBtnFrame:CGRectMake(10, CGRectGetMaxY(passBack.frame), 22, 22) title:@"忘记密码?" backgroundColor:[UIColor clearColor] titleColor:[UIColor blackColor] target:self action:@selector(remember)];
    [self addSubview:rememberButton];
    
    UILabel *rememberLabel = [MyUtil createLabelFrame:CGRectMake(CGRectGetMaxX(rememberButton.frame),CGRectGetMaxY(passBack.frame), 100, 44) title:@"记住密码" font:LFFont(14)];
    rememberLabel.textColor = [UIColor blackColor];
    rememberLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:rememberLabel];
    
    UIButton *forgetPassword = [MyUtil createBtnFrame:CGRectMake(Screen_width/4*3, CGRectGetMaxY(passBack.frame), Screen_width/4, 44) title:@"忘记密码?" backgroundColor:[UIColor clearColor] titleColor:[UIColor blackColor] target:self action:@selector(forgetPass)];
    [self addSubview:forgetPassword];
    
    UIButton *loginButton = [MyUtil createBtnFrame:CGRectMake(20, CGRectGetMaxY(forgetPassword.frame)+20, Screen_width-40, 40) title:@"登录" backgroundColor:TintColor titleColor:[UIColor whiteColor] target:self action:@selector(loginBtn)];
//    loginButton.layer.cornerRadius = QS_buttonCorner;
//    loginButton.autoresizingMask = YES;
    [self addSubview:loginButton];
    
    UIButton *userRegister = [MyUtil createBtnFrame:CGRectMake(0, self.frame.size.height-64-44, Screen_width, 44) title:@"新用户注册" backgroundColor:[UIColor clearColor] titleColor:TintColor target:self action:@selector(userRegist)];
    [self addSubview:userRegister];
    
//    UIImageView *imageView = [MyUtil createImageView:CGRectMake(40, CGRectGetMaxY(loginButton.frame)+40, Screen_width-80, self.frame.size.height-(CGRectGetMaxY(loginButton.frame)+40)-80) imageName:@"zhsyd_login"];
//    imageView.contentMode = UIViewContentModeCenter;
//    [self addSubview:imageView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//remember记住密码
-(void)remember
{
    if ([_delegate respondsToSelector:@selector(leftPresonalAndNotification:centerLeftOrRight:)]){
        [_delegate leftPresonalAndNotification:self centerLeftOrRight:ButtonTypeWithRemember];
    }
}

//用户注册
-(void)userRegist
{
    if ([_delegate respondsToSelector:@selector(leftPresonalAndNotification:centerLeftOrRight:)]){
        [_delegate leftPresonalAndNotification:self centerLeftOrRight:ButtonTypeWithRight];
    }
}
//忘记密码
-(void)forgetPass
{
    if ([_delegate respondsToSelector:@selector(leftPresonalAndNotification:centerLeftOrRight:)]){
        [_delegate leftPresonalAndNotification:self centerLeftOrRight:ButtonTypeWithLeft];
    }
}

//登录按钮
-(void)loginBtn
{
    if ([_delegate respondsToSelector:@selector(leftPresonalAndNotification:centerLeftOrRight:)]){
        [_delegate leftPresonalAndNotification:self centerLeftOrRight:ButtonTypeWithCenter];
    }
}

#pragma mark - UITextField 代理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userIDField resignFirstResponder];
    [_passwordField resignFirstResponder];
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
