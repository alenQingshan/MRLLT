//
//  MainTabberController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MainTabbarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>

@interface MainTabbarController()<UITabBarControllerDelegate>
@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    FirstViewController *notes=[[FirstViewController alloc]init];
    [self addChildViewController:notes withTitle:@"首页" image:[UIImage imageNamed:@"first"] selectedImage:[UIImage imageNamed:@"first_select"]];
    SecondViewController *tactics=[[SecondViewController alloc]init];
    [self addChildViewController:tactics withTitle:@"消息" image:[UIImage imageNamed:@"second"] selectedImage:[UIImage imageNamed:@"second_select"]];
    ThirdViewController *tools=[[ThirdViewController alloc]init];
    [self addChildViewController:tools withTitle:@"软件开发" image:[UIImage imageNamed:@"third"] selectedImage:[UIImage imageNamed:@"third_select"]];
    FourthViewController *soft=[[FourthViewController alloc]init];
    [self addChildViewController:soft withTitle:@"记录" image:[UIImage imageNamed:@"fourth"] selectedImage:[UIImage imageNamed:@"fourth_select"]];
    
    self.tabBar.tintColor=TintColor;
    self.delegate = self;
//    self.tabBar.backgroundColor=[UIColor whiteColor];
    
//    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    [self.tabBar setBackgroundImage:img];
//    [self.tabBar setShadowImage:img];
//    [self.tabBar setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]]];
    
}

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
/**
 *  添加子控制器到tabbar,并封装一个navgationbar
 *
 *  @param childController 子控制器对象
 *  @param title           子控制器标题
 *  @param image           tabbaritem正常图片
 *  @param selectedImage   tabbaritem选中图片
 */
-(void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    childController.tabBarItem=[[UITabBarItem alloc]initWithTitle:title image:image selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:TintColor} forState:UIControlStateSelected];
    /**
     给每个控制器添加一个UINavigationController
     */
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:navigationController];
}


//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
//{
    //这里我判断的是当前点击的tabBarItem的标题
//    if ([viewController.tabBarItem.title isEqualToString:@"我的账户"]) {
//        //如果用户信息存在的话，说明已登陆
//        if([NetWorkBaseTool getLoginMsg]){
//            return YES;
//        }else{
//            TYAlertView *alertView = [TYAlertView alertViewWithTitle:@"系统提示" message:@"您还没有登录呦,请登录(^o^)/YES!"];
//            alertView.buttonDefaultBgColor = TintColor;
//            [alertView addAction:[TYAlertAction actionWithTitle:@"取消" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
//            }]];
//            [alertView addAction:[TYAlertAction actionWithTitle:@"确定" style:TYAlertActionStyleDefault handler:^(TYAlertAction *action) {
//                LoginViewController *login = [[LoginViewController alloc]init];
//                login.hidesBottomBarWhenPushed = YES;
//                [((UINavigationController *)tabBarController.selectedViewController) pushViewController:login animated:YES];
//            }]];
//            [alertView showInController:self preferredStyle:TYAlertControllerStyleAlert];
//            return NO;
//        }
//    }else{
//        return YES;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
