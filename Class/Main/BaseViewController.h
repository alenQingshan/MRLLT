//
//  BaseViewController.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)setNavigation:(NSString *)title;
-(void)setNavigation:(NSString *)title textFont:(UIFont *)font;
//-(void)showProgressHUD;
//-(void)hideProgressHUD;

@end
