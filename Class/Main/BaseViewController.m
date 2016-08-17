//
//  BaseViewController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];


//    self.navigationController.navigationBar.barTintColor = TintColor;//只写这个会存在问题
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:TintColor] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];//控制返回按钮
    
    [self.navigationController.navigationBar setTranslucent:NO];
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

-(void)setNavigation:(NSString *)title
{
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:TintColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:22],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    self.navigationItem.title = title;
}

-(void)setNavigation:(NSString *)title textFont:(UIFont *)font
{
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:TintColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:font,
    NSForegroundColorAttributeName:[UIColor whiteColor],}];
    [self.navigationController.navigationBar setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    self.navigationItem.title = title;
}

//-(void)showProgressHUD
//{
//    UIImageView *gifview = [MyUtil createGifImageViewimageName:[UIImage sd_animatedGIFNamed:@"bird"]];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.color=[UIColor whiteColor];
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.customView=gifview;
//    [hud show:YES];
//}

//-(void)hideProgressHUD
//{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}

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

@end
