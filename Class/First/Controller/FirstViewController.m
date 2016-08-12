//
//  FirstViewController.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "FirstViewController.h"
#import "SynthSegment.h"
#import "LoginViewController.h"
#import "HeaderView.h"
#import "MyCollectionCell.h"


#define myCellId  @"mCellId"
@interface FirstViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableview;
}
@property(nonatomic,strong)UICollectionView *mCollevtionView;

@end

@implementation FirstViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=WhiteColor;
    [self setNavigation:@"首页"];
    //导航栏按钮
    [self createBarButtonItem];
    [self createMainUI];
}

-(void)createBarButtonItem
{
    UIBarButtonItem *leftButton =  [UIBarButtonItem itemWithTarget:self action:@selector(backToLogin) nomalImage:[UIImage imageNamed:@"people"] higeLightedImage:[UIImage imageNamed:@"people"]];
    self.navigationItem.leftBarButtonItem=leftButton;
    
    UIBarButtonItem *rightButton =  [UIBarButtonItem itemWithTarget:self action:@selector(erweima) nomalImage:[UIImage imageNamed:@"register_codes"] higeLightedImage:[UIImage imageNamed:@"register_codes"]];
    self.navigationItem.rightBarButtonItem=rightButton;
}

-(void)backToLogin
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
    window.rootViewController = nav;
}

-(void)erweima
{
    NSLog(@"1111");
}

-(void)createMainUI
{
    UIView *tableviewHead = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 280)];
    HeaderView *headview = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 160)];
    [tableviewHead addSubview:headview];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.mCollevtionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 160, Screen_width, 120) collectionViewLayout:flow];
    self.mCollevtionView.delegate = self;
    self.mCollevtionView.dataSource = self;
    [self.mCollevtionView setBackgroundColor:WhiteColor];
    [self.mCollevtionView registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:myCellId];
    [tableviewHead addSubview:self.mCollevtionView];
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64-49) style:UITableViewStylePlain];
    _tableview.tableHeaderView = tableviewHead;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];

}

#pragma mark - UICollectionView 代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //从重用队列获取对象
    MyCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:myCellId forIndexPath:indexPath];
    //显示数据
    NSArray *sectionArray=@[@"fa-credit-card",@"fa-file-text-o",@"fa-list-alt",@"fa-ioxhost",@"fa-usd",@"fa-volume-up"];
    NSString *str=sectionArray[indexPath.row];
    [cell config:str index:indexPath.row];
    
    return cell;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((Screen_width-8)/3, 57.5);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
}

//横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

//纵向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"firstID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSInteger money = 20;
    cell.textLabel.text = [NSString stringWithFormat:@"%li元",money+indexPath.row*10];
    cell.detailTextLabel.text = @"本地可用,到账以运营商信息为准";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
