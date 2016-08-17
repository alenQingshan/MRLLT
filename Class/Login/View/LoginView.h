//
//  LoginView.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginView;

typedef enum : NSUInteger {
    ButtonTypeWithLeft = 1,
    ButtonTypeWithCenter,
    ButtonTypeWithRight,
    ButtonTypeWithRemember
} ButtonTypeWithClick;

@protocol LoginViewDelegate <NSObject>

-(void)LoginView:(LoginView *)view centerLeftOrRight:(NSInteger)wtf isremember:(BOOL)remem username:(NSString *)phone passwork:(NSString *)pwd;

@optional

@end



@interface LoginView : UIView <UITextFieldDelegate>


@property (nonatomic,assign) id<LoginViewDelegate>delegate;//代理属性
@property (nonatomic,strong)UITextField *userIDField;//用户名
@property (nonatomic,strong)UITextField *passwordField;//密码
@property (nonatomic,strong)UIButton *rememberButton;//记住密码


@end
