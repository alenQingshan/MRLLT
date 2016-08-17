//
//  ForgetPasswordView.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForgetPasswordView;

typedef enum : NSUInteger {
    ButtonTypeWithLeft = 1,
    ButtonTypeWithRight
} ButtonTypeWithClick;

@protocol ForgetPasswordViewDelegate <NSObject>

-(void)ForgetPasswordView:(ForgetPasswordView *)view userName:(NSString *)phone passWord:(NSString *)pwd;

@optional

@end

@interface ForgetPasswordView : UIView <UITextFieldDelegate>

@property (nonatomic,assign) id<ForgetPasswordViewDelegate>delegate;//代理属性

@property (nonatomic,strong)UITextField *userIDField;//用户名
@property (nonatomic,strong)UITextField *passwordField;//密码
@property (nonatomic,strong)UITextField *invitationField;//邀请码
@property (nonatomic,strong)UITextField *testwordField;//验证码

@property (nonatomic, strong) UIButton *getTestword;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int second;
@property (nonatomic, assign) BOOL agree;

- (void)addTimer;

@end
