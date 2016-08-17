//
//  NetWorking.m
//  MRLLT
//
//  Created by 刘青山 on 16/8/15.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "NetWorking.h"
#import "AFNetworking.h"
#import "LoginViewController.h"
@implementation NetWorking

#pragma mark - 注册接口
+ (void)registerblock :(void (^)(NSMutableDictionary *dict))block username:(NSString *)user password:(NSString *)pwd re_password:(NSString *)rpwd vercode:(NSString *)code
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MainURL,MR_Register_API];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __block NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSDictionary *paramet = [CustomTool returnParamet];
    [paramet setValue:user forKey:@"username"];
    [paramet setValue:pwd forKey:@"password"];
    [paramet setValue:rpwd forKey:@"re_password"];
    [paramet setValue:code forKey:@"vercode"];
    NSLog(@"%@%@",url,paramet);
    [manager POST:url parameters:paramet success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        if([dict[@"status"] integerValue] == 1){
            [MBProgressHUD showSuccess:dict[@"msg"]];
            if (block) {
                block(dict);
            }
        }else{
            [NetWorking refreshMsg:dict];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [NetWorking dealWithErrorData:operation];
    }];
}


#pragma mark - 获取验证码
+ (void)getVercodeblock :(void (^)(NSMutableDictionary *dict))block username:(NSString *)user
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MainURL,MR_Vercode_API];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __block NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSDictionary *paramet = [CustomTool returnParamet];
    [paramet setValue:user forKey:@"username"];
    NSLog(@"%@%@",url,paramet);
    [manager POST:url parameters:paramet success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        if([dict[@"status"] integerValue] == 1){
            if (block) {
                block(dict);
            }
        }else{
            [NetWorking refreshMsg:dict];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [NetWorking dealWithErrorData:operation];
    }];
}

#pragma mark - 登录接口
+ (void)loginblock :(void (^)(NSMutableDictionary *dict))block username:(NSString *)user password:(NSString *)pwd
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MainURL,MR_Login_API];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __block NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSDictionary *paramet = [CustomTool returnParamet];
    [paramet setValue:user forKey:@"username"];
    [paramet setValue:pwd forKey:@"password"];
    NSLog(@"%@%@",url,paramet);
    [manager POST:url parameters:paramet success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        if([dict[@"status"] integerValue] == 1){
            if (block) {
                block(dict);
            }
        }else{
            [NetWorking refreshMsg:dict];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [NetWorking dealWithErrorData:operation];
    }];
}

#pragma mark - 忘记密码接口
+ (void)ForgetPassword:(void (^)(NSMutableDictionary *dict))block username:(NSString *)user password:(NSString *)pwd re_password:(NSString *)rpwd
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MainURL,MR_ForgetPassword_API];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __block NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSDictionary *paramet = [CustomTool returnParamet];
    [paramet setValue:user forKey:@"username"];
    [paramet setValue:pwd forKey:@"password"];
    [paramet setValue:rpwd forKey:@"re_password"];
    NSLog(@"%@%@",url,paramet);
    [manager POST:url parameters:paramet success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        if([dict[@"status"] integerValue] == 1){
            [MBProgressHUD showSuccess:dict[@"msg"]];
            if (block) {
                block(dict);
            }
        }else{
            [NetWorking refreshMsg:dict];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [NetWorking dealWithErrorData:operation];
    }];
}

#pragma mark - 手机号归属地接口
+ (void)MobileInfo:(void (^)(NSMutableDictionary *dict))block phoneNum:(NSString *)num
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MainURL,MR_getMobileInfo_API];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __block NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSDictionary *paramet = [CustomTool returnParamet];
    [paramet setValue:num forKey:@"mobile"];
    [manager POST:url parameters:paramet success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        if([dict[@"status"] integerValue] == 1){
            if (block) {
                block(dict);
            }
        }else{
            [NetWorking refreshMsg:dict];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [NetWorking dealWithErrorData:operation];
    }];
}

#pragma mark - 首页流量以及金额接口
+ (void)getPrice:(void (^)(NSMutableDictionary *dict))block phoneNum:(NSString *)num flowSize:(NSString *)size
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MainURL,MR_getPrice_API];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    __block NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSDictionary *paramet = [CustomTool returnParamet];
    [paramet setValue:num forKey:@"mobile"];
    [paramet setValue:size forKey:@"flowsize"];
    [manager POST:url parameters:paramet success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dict);
        if([dict[@"status"] integerValue] == 1){
            if (block) {
                block(dict);
            }
        }else{
            [NetWorking refreshMsg:dict];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [NetWorking dealWithErrorData:operation];
    }];
}


#pragma mark - error
+ (void)dealWithErrorData:(AFHTTPRequestOperation *)task
{
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    int statuscode = (int)response.statusCode;
    if (statuscode == 0) {
        [MBProgressHUD showError:@"网络状况不太好喔，请稍后再试≧ε ≦"];
    }else if (statuscode == 403) {
        [MBProgressHUD showError:@"请尝试重新登录"];
    }else if (statuscode != 200){
        [MBProgressHUD showError:@"正在更新新功能"];
    }
}

#pragma mark - 重新登录
+ (void)uninstall
{
    //    [[ManageTool sharedManageTool] uninstall];
    //    // 清除缓存
    //    NSString *imageCachePath = [[SDImageCache sharedImageCache] makeDiskCachePath:@"default"];
    //    NSFileManager *mgr = [NSFileManager defaultManager];
    //    [mgr removeItemAtPath:imageCachePath error:nil];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
    QSWindow.rootViewController = nav;
}

+ (void)refreshMsg:(NSDictionary *)result
{
    NSInteger code = [result[@"res_code"] integerValue];
    switch (code) {
        case 0:
        {
            [MBProgressHUD showError:result[@"msg"]];
        }
            break;
            
        default:
            [MBProgressHUD showError:result[@"msg"]];
            break;
    }
}
@end
