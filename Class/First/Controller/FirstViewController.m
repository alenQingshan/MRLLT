//
//  FirstViewController.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "FirstViewController.h"
#import "SynthSegment.h"
#import "MoveViewController.h"
#import "ExtendViewController.h"
#import "TelecommunicationViewController.h"
#import "LoginViewController.h"
#import "HeaderView.h"
@interface FirstViewController ()<UIScrollViewDelegate,SynthDelegate>
{
    
}
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property(nonatomic,strong)NSMutableArray *buttonList;
@property (nonatomic, weak) SynthSegment *segment;
@property(nonatomic,weak)CALayer *LGLayer;

@end

@implementation FirstViewController

//懒加载
- (NSMutableArray *)buttonList
{
    if (!_buttonList)
    {
        _buttonList = [NSMutableArray array];
    }
    return _buttonList;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=WhiteColor;
    [self setNavigation:@"首页"];
    [self addHead];
    //加载Segment
    [self setSegment];
    //加载ViewController
    [self addChildViewController];
    //加载ScrollView
    [self setContentScrollView];
    //导航栏按钮
    [self createBarButtonItem];
}

-(void)addHead
{
    HeaderView *head = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, 100)];
    [self.view addSubview:head];
}

-(void)setSegment
{
    [self buttonList];
    //初始化
    SynthSegment *segment = [[SynthSegment alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, QS_segmentH) withObject:@[@"中国移动",@"中国联通",@"中国电信"]];
    segment.delegate = self;
    segment.backgroundColor = FirstBackcolor;
    self.segment = segment;
    [self.view addSubview:segment];
    [self.buttonList addObject:segment.buttonList];
    self.LGLayer = segment.LGLayer;
}

-(void)addChildViewController
{
    //直投类
    MoveViewController  *DirectVC = [[MoveViewController alloc]init];
    [self addChildViewController:DirectVC];
    //综合类
    ExtendViewController  *SynthesizeVC = [[ExtendViewController alloc]init];
    [self addChildViewController:SynthesizeVC];
    //债权转让
    TelecommunicationViewController *TransferVC = [[TelecommunicationViewController alloc]init];
    [self addChildViewController:TransferVC];
}

-(void)setContentScrollView
{
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0,100 + QS_segmentH, self.view.frame.size.width, Screen_height-QS_segmentH-64-49-100)];
    [self.view addSubview:sv];
    sv.bounces = NO;
    sv.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    sv.contentOffset = CGPointMake(0, 0);
    sv.pagingEnabled = YES;
    sv.showsHorizontalScrollIndicator = NO;
    sv.scrollEnabled = YES;
    sv.userInteractionEnabled = YES;
    sv.delegate = self;
    
    for (int i=0; i<self.childViewControllers.count; i++) {
        UIViewController * vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i * Screen_width,0, Screen_width, Screen_height-QS_segmentH-64-49-100);
        NSLog(@"wo的 = %f",vc.view.frame.size.height);
        [sv addSubview:vc.view];
    }
    sv.contentSize = CGSizeMake(3 * Screen_width, 0);
    self.contentScrollView = sv;
}

-(void)createBarButtonItem
{
    UIBarButtonItem *leftButton =  [UIBarButtonItem itemWithTarget:self action:@selector(backToLogin) nomalImage:[UIImage imageNamed:@"register_invitation_code"] higeLightedImage:[UIImage imageNamed:@"register_invitation_code"]];
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

#pragma mark - UIScrollViewDelegate
//实现LGSegment代理方法
-(void)scrollToPage:(int)Page {
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = self.view.frame.size.width * Page;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentScrollView.contentOffset = offset;
    }];
}
// 只要滚动UIScrollView就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    [self.segment moveToOffsetX:offsetX];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"warning");
}

@end
