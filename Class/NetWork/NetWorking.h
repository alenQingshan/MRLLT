//
//  NetWorking.h
//  MRLLT
//
//  Created by 刘青山 on 16/8/15.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorking : NSObject


+ (void)registerblock :(void (^)(NSMutableDictionary *dict))block username:(NSString *)user password:(NSString *)pwd re_password:(NSString *)rpwd vercode:(NSString *)code;//注册

+ (void)getVercodeblock :(void (^)(NSMutableDictionary *dict))block username:(NSString *)user;//获取验证码

+ (void)loginblock :(void (^)(NSMutableDictionary *dict))block username:(NSString *)user password:(NSString *)pwd;//登录接口

+ (void)ForgetPassword:(void (^)(NSMutableDictionary *dict))block username:(NSString *)user password:(NSString *)pwd re_password:(NSString *)rpwd;//忘记密码接口

+ (void)MobileInfo:(void (^)(NSMutableDictionary *dict))block phoneNum:(NSString *)num;//手机号归属地接口

+ (void)getPrice:(void (^)(NSMutableDictionary *dict))block phoneNum:(NSString *)num flowSize:(NSString *)size;//首页流量以及金额接口

@end
