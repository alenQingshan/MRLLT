//
//  SecondViewController.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableview;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigation:@"站内信息"];
    [self createUI];
}

-(void)createUI
{
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64-44) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
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

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    NSArray *arr = [NSArray arrayWithObjects:@"河北省内",@"浙江移动3G",@"电信省内1G",@"中国移动WiFi覆盖通知",@"下载米瑞app",nil];
    NSArray *arrdetail = [NSArray arrayWithObjects:@"米瑞推出河北省内流量包1G25元",@"浙江移动300M15元",@"电信省内1G流量30元,更有积分来拿",@"8月起石家庄为第一试点",@"米瑞app致力于为您提供优质服务",nil];
    cell.textLabel.text = arr[indexPath.row];
    cell.detailTextLabel.text = arrdetail[indexPath.row];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    return cell;
}

@end
