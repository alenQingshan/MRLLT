//
//  MoveViewController.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MoveViewController.h"
#import "BodyView.h"
@interface MoveViewController ()

@end

@implementation MoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WhiteColor;
    NSLog(@"%f",self.view.frame.size.height);
    BodyView *body = [[BodyView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:body];
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
