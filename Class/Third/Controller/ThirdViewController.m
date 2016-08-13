//
//  ThirdViewController.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
{
    UITextView *_textView;
}
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation:@"软件开发"];
    [self createUI];
}

-(void)createUI
{
    _textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    _textView.text = @"";
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"getMoneyHelp" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64-49)];
    [self.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
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

@end
