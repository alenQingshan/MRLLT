//
//  ForgetController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "ForgetController.h"
#import "ForgetPasswordView.h"

@interface ForgetController ()<ForgetPasswordViewDelegate>

@property(nonatomic,strong)ForgetPasswordView *forgetPasswordView;

@end

@implementation ForgetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation:@"找回密码"];
    [self cteateUI];
}

-(void)cteateUI
{
    _forgetPasswordView = [[ForgetPasswordView alloc]initWithFrame:self.view.bounds];
    _forgetPasswordView.delegate = self;
    [self.view addSubview:_forgetPasswordView];
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
#pragma mark - ForgetPasswordViewDelegate
-(void)leftPresonalAndNotification:(ForgetPasswordView *)view leftOrRight:(NSInteger)wtf
{
    if (wtf == 1) {
        
    }else{
    }
}

@end
