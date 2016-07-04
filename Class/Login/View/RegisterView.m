//
//  RegisterView.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView()

@end

@implementation RegisterView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _agree = YES;
        self.second = 60;
        self.backgroundColor = WhiteColor;
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    UIView *userback = [[UIView alloc]initWithFrame:CGRectMake(10, 20, Screen_width-20, 44)];
    userback.backgroundColor = [UIColor whiteColor];
    [self addSubview:userback];
    
    UIView *passBack = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(userback.frame)+1, Screen_width-20, 44)];
    passBack.backgroundColor = [UIColor whiteColor];
    [self addSubview:passBack];
    
    UIView *invitBack = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(passBack.frame)+1, Screen_width-20, 44)];
    invitBack.backgroundColor = [UIColor whiteColor];
    [self addSubview:invitBack];
    
    UIView *testback = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(invitBack.frame)+1, Screen_width-20, 44)];
    testback.backgroundColor = [UIColor whiteColor];
    [self addSubview:testback];
    
    UIImageView *userImage = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_phone"];
    [userback addSubview:userImage];
    
    UIImageView *passwordImage = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_password"];
    [passBack addSubview:passwordImage];
    
    UIImageView *invitImage = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_invitation_code"];
    [invitBack addSubview:invitImage];
    
    UIImageView *testImage = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_codes"];
    [testback addSubview:testImage];
    
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width-64, 44) placeHolder:@"请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.delegate = self;
    [userback addSubview:_userIDField];
    
    _passwordField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width/3*2-44, 44) placeHolder:@"请输入短信验证码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _passwordField.delegate = self;
    [passBack addSubview:_passwordField];
    
    _getTestword = [MyUtil createBtnFrame:CGRectMake(CGRectGetMaxX(_passwordField.frame), 5, Screen_width/3-30, 34) title:@"获取验证码" backgroundColor:[UIColor whiteColor] titleColor:TintColor target:self action:@selector(getTextWord)];
    [_getTestword.layer setBorderWidth:1.0];
    _getTestword.layer.borderColor=TintColor.CGColor;
    [passBack addSubview:_getTestword];
    
    _invitationField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width-64, 44) placeHolder:@"请输入新密码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _invitationField.delegate = self;
    [invitBack addSubview:_invitationField];
    
    _testwordField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width-64, 44) placeHolder:@"再次确认密码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _testwordField.delegate = self;
    [testback addSubview:_testwordField];
    
//    _addButton = [MyUtil createBtnFrame:CGRectMake(20, CGRectGetMaxY(testback.frame)+20, 20, 20) title:nil backgroundColor:nil titleColor:[UIColor whiteColor] target:self action:@selector(addcon)];
//    [_addButton setBackgroundImage:[UIImage imageNamed:@"register_checked"] forState:UIControlStateNormal];
//    [self addSubview:_addButton];
    
    UILabel *registerLabel = [MyUtil createLabelFrame:CGRectMake(0, CGRectGetMaxY(testback.frame)+10, Screen_width, 20) title:@"6-16个字符,区分大小写,不能为纯数字" font:LFFont(SubTitleFont)];
    registerLabel.textAlignment = NSTextAlignmentCenter;
    registerLabel.textColor = [UIColor grayColor];
    [self addSubview:registerLabel];
    
//    UIButton *contractButton = [MyUtil createBtnFrame:CGRectMake(CGRectGetMaxX(registerLabel.frame), CGRectGetMaxY(testback.frame)+20, 100, 20) title:@"<<借款合同>>" backgroundColor:[UIColor clearColor] titleColor:TintColor target:self action:@selector(contract)];
//    [self addSubview:contractButton];
    
    UIButton *registerButton = [MyUtil createBtnFrame:CGRectMake(20, CGRectGetMaxY(registerLabel.frame)+20, Screen_width-40, 40) title:@"确定" backgroundColor:TintColor titleColor:[UIColor whiteColor] target:self action:@selector(registerUser)];
//    registerButton.layer.cornerRadius = QS_buttonCorner;
//    registerButton.autoresizingMask = YES;
    [self addSubview:registerButton];
    
    UILabel *agreeLabel = [MyUtil createLabelFrame:CGRectMake((Screen_width-170)/2, CGRectGetMaxY(registerButton.frame)+5, 170, 22) title:@"我已经阅读并同意使用条款和隐私策略" font:nil];
    agreeLabel.font = LFFont(10);
    [self addSubview:agreeLabel];
    
    UIButton *agreeButton = [MyUtil createBtnFrame:CGRectMake(CGRectGetMinX(agreeLabel.frame)-22, CGRectGetMaxY(registerButton.frame)+5, 22, 22) title:@"123" backgroundColor:nil titleColor:nil target:self action:@selector(agree)];
    [self addSubview:agreeButton];

}

//是否同意合同
//-(void)addcon
//{
//    if (_agree) {
//        _agree = NO;
//        [self.addButton setBackgroundImage:[UIImage imageNamed:@"register_unchecked"] forState:UIControlStateNormal];
//    }else{
//        _agree = YES;
//        [_addButton setBackgroundImage:[UIImage imageNamed:@"register_checked"] forState:UIControlStateNormal];
//    }
//}

//查看合同
-(void)contract
{
    
}

//获取验证码
-(void)getTextWord
{
    if (self.userIDField.text.length < 11){
        return;
    }else{
        NSLog(@"请输入手机号码");
    }
    if (self.second < 60) return;
    [self addTimer];
}

//注册
-(void)registerUser
{
    NSLog(@"点击");
}

#pragma mark - 倒计时
- (void)addTimer
{
    //  秒后再次发送
    self.timer = [NSTimer timerWithTimeInterval:1.f target:self selector:@selector(countTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

// 下一页
- (void)countTime
{
    self.second -- ;
    if (self.second > 0) {
        [self.getTestword setTitle:[NSString stringWithFormat:@"%d",self.second] forState:UIControlStateNormal];
    }else{
        [self removeTimer];
        [self.getTestword setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.second = 60;
    }
}

- (void)removeTimer
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark - UITextField 代理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userIDField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_invitationField resignFirstResponder];
    [_testwordField resignFirstResponder];
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
