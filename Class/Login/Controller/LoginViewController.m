//
//  LoginViewController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/7.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterController.h"
#import "ForgetController.h"
#import "MainTabbarController.h"
@interface LoginViewController ()<LoginViewDelegate>
{
    
}
@property(nonatomic,strong)LoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation:@"登录"];
    [self cteateUI];
}

-(void)cteateUI
{
    _loginView = [[LoginView alloc]initWithFrame:self.view.bounds];
    _loginView.delegate = self;
    [self.view addSubview:_loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - LoginViewDelegate
-(void)leftPresonalAndNotification:(LoginView *)view centerLeftOrRight:(NSInteger)wtf isremember:(BOOL)remem
{
    ForgetController *forget = [[ForgetController alloc]init];
    RegisterController *regist = [[RegisterController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    MainTabbarController *tabVC = [[MainTabbarController alloc] init];
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    switch (wtf) {
        case 1:
            [self.navigationController pushViewController:forget animated:YES];
            break;
        case 2:
            window.rootViewController = tabVC;
            del.tabVC = tabVC;
            break;
        case 3:
            [self.navigationController pushViewController:regist animated:YES];
            break;
        case 4:
            //记住密码
            break;
//        default:
//            NSLog(@"!");
//            break;
    }
}



@end
