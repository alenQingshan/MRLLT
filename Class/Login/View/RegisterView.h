//
//  RegisterView.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisterView;
typedef enum : NSUInteger {
    ButtonTypeWithLeft = 1,
    ButtonTypeWithRight
} ButtonTypeWithClick;

@protocol RegisterViewDelegate <NSObject>

-(void)leftPresonalAndNotification:(RegisterView *)view leftOrRight:(NSInteger)wtf;

@optional

@end

@interface RegisterView : UIView <UITextFieldDelegate>

@property (nonatomic,assign) id<RegisterViewDelegate>delegate;//代理属性

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
