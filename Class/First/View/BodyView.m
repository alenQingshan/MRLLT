//
//  BodyView.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "BodyView.h"
#import <WebKit/WebKit.h>
@implementation BodyView
{
    UIButton *_agreeButton;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    UIView *userback = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Screen_width-20, 44)];
    userback.backgroundColor = [UIColor whiteColor];
    [self addSubview:userback];
    
    UIImageView *userImage = [MyUtil createImageView:CGRectMake(10, 11, 22, 22) imageName:@"register_phone"];
    [userback addSubview:userImage];
    
    _userIDField = [MyUtil createTextFieldFrame:CGRectMake(44, 0, Screen_width-64, 44) placeHolder:@"请输入手机号码" isPwd:NO pleaseColor:[UIColor clearColor] pleaseRadius:QS_textFieldCorner];
    _userIDField.delegate = self;
    [userback addSubview:_userIDField];
    
    _agreeButton = [MyUtil createBtnFrame:CGRectMake(10, CGRectGetMaxY(userback.frame)+20, Screen_width-20, 40) title:@"立即支付" backgroundColor:TintColor titleColor:[UIColor whiteColor] target:self action:@selector(agree)];
    [self addSubview:_agreeButton];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"getMoneyHelp" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_agreeButton.frame)+10, Screen_width, 120)];
    webView.scrollView.scrollEnabled = NO;
    [self addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(void)agree
{
    
}

-(void)buttonClick:(UIButton *)btn
{
    NSLog(@"%li",btn.tag);
    
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
