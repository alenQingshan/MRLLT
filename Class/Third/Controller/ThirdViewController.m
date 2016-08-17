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
    UIScrollView *mainView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height-64-49)];
    mainView.contentSize = CGSizeMake(0, 480);
    mainView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainView];
    UILabel *titleLabel = [MyUtil createLabelFrame:CGRectMake((Screen_width-80)/2, 10, 80, 30) title:@"公司简介" font:LFFont(TitleFont)];
    titleLabel.textColor = Black_color;
    titleLabel.font = LFFont(20);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:titleLabel];
    
    UILabel *subleftLabel = [MyUtil createLabelFrame:CGRectMake(0, 10, Screen_width/2-40, 30) title:@"--" font:LFFont(TitleFont)];
    subleftLabel.textColor = TintColor;
    subleftLabel.font = LFFont(20);
    subleftLabel.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:subleftLabel];
    
    UILabel *subrightLabel = [MyUtil createLabelFrame:CGRectMake(Screen_width/2+40, 10, Screen_width/2-40, 30) title:@"--" font:LFFont(TitleFont)];
    subrightLabel.textColor = TintColor;
    subrightLabel.font = LFFont(20);
    subrightLabel.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:subrightLabel];
    
    UITextView *detailLabel = [[UITextView alloc]initWithFrame:CGRectMake(20, 50, Screen_width-40, 220)];
    detailLabel.text = @"        石家庄米瑞软件科技有限公司是一家位于石家庄以创新为主导的科技型股份制企业,公司长期与中国移动,中国电信,中国联通合作,骨干均为有5年以上高级研发工程师,架构师.主要从事移动互联网,计算机软件的产品生产,销售,研发,技术咨询,技术转让与服务.\n        产品群包括:流量及时充值和代理系统,物业管理系统及第三方监督与估价其他互联网相关技术服务(网页web+移动端app+微信平台结合体端).";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 2;// 字体的行间距
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:Black_color};
    detailLabel.attributedText = [[NSAttributedString alloc] initWithString:detailLabel.text attributes:attributes];
    
    [mainView addSubview:detailLabel];
    
    UIButton *phone = [MyUtil createBtnFrame:CGRectMake(Screen_width/2 - 40, CGRectGetMaxY(detailLabel.frame), Screen_width/2 +20, 40) title:@"联系我们:0311-88892450" backgroundColor:[UIColor clearColor] titleColor:TintColor target:self action:@selector(phoneMiri)];
    [mainView addSubview:phone];
    
    UILabel *titleLabel2 = [MyUtil createLabelFrame:CGRectMake((Screen_width-140)/2, CGRectGetMaxY(phone.frame)+10, 140, 30) title:@"公司的核心优势" font:LFFont(TitleFont)];
    titleLabel2.textColor = Black_color;
    titleLabel2.font = LFFont(20);
    titleLabel2.textAlignment = NSTextAlignmentCenter;
    [mainView addSubview:titleLabel2];
    
    UILabel *subleftLabel2 = [MyUtil createLabelFrame:CGRectMake(0, CGRectGetMaxY(phone.frame)+10, Screen_width/2-70, 30) title:@"--" font:LFFont(TitleFont)];
    subleftLabel2.textColor = TintColor;
    subleftLabel2.font = LFFont(20);
    subleftLabel2.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:subleftLabel2];
    
    UILabel *subrightLabel2 = [MyUtil createLabelFrame:CGRectMake(Screen_width/2+70, CGRectGetMaxY(phone.frame)+10, Screen_width/2-70, 30) title:@"--" font:LFFont(TitleFont)];
    subrightLabel2.textColor = TintColor;
    subrightLabel2.font = LFFont(20);
    subrightLabel2.textAlignment = NSTextAlignmentLeft;
    [mainView addSubview:subrightLabel2];
    
    UITextView *detailLabel2 = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(titleLabel2.frame), Screen_width-40, 130)];
    detailLabel2.text = @"品牌竞争力\n我司致力于打造针对于企业及个人用户的互联网信誉品牌\n文化竞争力\n公司文化以 ""服务客户,信誉第一"" 为宗旨且以提升客户的核心竞争力为目的.";
    detailLabel2.textColor = [UIColor grayColor];
    [mainView addSubview:detailLabel2];
    
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle2.lineSpacing = 2;// 字体的行间距
    NSDictionary *attributes2 = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSParagraphStyleAttributeName:paragraphStyle2,NSForegroundColorAttributeName:Black_color};
    detailLabel2.attributedText = [[NSAttributedString alloc] initWithString:detailLabel2.text attributes:attributes2];
}

-(void)phoneMiri
{
    
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
