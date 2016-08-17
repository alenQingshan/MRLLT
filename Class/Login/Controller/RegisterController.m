//
//  RegisterController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/12.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "RegisterController.h"
#import "RegisterView.h"
@interface RegisterController ()<RegisterViewDelegate>

@property(nonatomic,strong)RegisterView *registerView;

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation:@"注册"];
    [self cteateUI];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)cteateUI
{
    _registerView = [[RegisterView alloc]initWithFrame:self.view.bounds];
    _registerView.delegate = self;
    [self.view addSubview:_registerView];
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

#pragma mark - RegisterViewDelegate
-(void)RegisterView:(RegisterView *)view phoneNum:(NSString *)phone verCode:(NSString *)code passWord:(NSString *)pwd
{
    [NetWorking registerblock:^(NSMutableDictionary *dict) {
        [self.navigationController popViewControllerAnimated:YES];
    } username:phone password:pwd re_password:pwd vercode:code];
}


@end
