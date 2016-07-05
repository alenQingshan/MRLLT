//
//  MoveViewController.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MoveViewController.h"
#import "BodyView.h"
#import "MyCollectionCell.h"

#define myCellId  @"mCellId"

@interface MoveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIScrollView *_scrollView;
}
@property(nonatomic,strong)UICollectionView *mCollevtionView;
@end

@implementation MoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WhiteColor;
    [self createScorllView];
}


-(void)createScorllView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-QS_segmentH-64-49-100)];
    _scrollView.contentSize = CGSizeMake(Screen_width, 360);
    NSLog(@"112%f",self.view.frame.size.height);
    [self.view addSubview:_scrollView];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.mCollevtionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 120) collectionViewLayout:flow];
    self.mCollevtionView.delegate = self;
    self.mCollevtionView.dataSource = self;
//    self.mCollevtionView.scrollEnabled = NO;
    [self.mCollevtionView setBackgroundColor:WhiteColor];
    [self.mCollevtionView registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:myCellId];
    [_scrollView addSubview:self.mCollevtionView];
    
    BodyView *body = [[BodyView alloc]initWithFrame:CGRectMake(0, 120, Screen_width, 240)];
    [_scrollView addSubview:body];
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

#pragma mark - UICollectionView 代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
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
    return CGSizeMake((Screen_width-80)/3, 30);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

//横向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.0f;
}

//纵向间距
- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20.0f;
}

@end
