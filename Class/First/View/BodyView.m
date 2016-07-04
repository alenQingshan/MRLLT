//
//  BodyView.m
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "BodyView.h"

@implementation BodyView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    self.mbuttunArray = [NSMutableArray arrayWithObjects:@"20M",@"50M",@"100M",@"200M",@"500M",nil];
    // 添加6个按钮
    int maxCols = 3;
    CGFloat buttonW = (Screen_width-80)/3;
    CGFloat buttonH = 40;
    CGFloat buttonStarY = 20;
    CGFloat buttonStarX = 20;
    CGFloat xMargin = (Screen_width - 2 * buttonStarX - maxCols * buttonW) / (maxCols - 1);
    CGFloat yMargin = 20;
    
    for (int i = 0; i < self.mbuttunArray.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:self.mbuttunArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
        // 设置frame
        button.width = buttonW;
        button.height = buttonH;
        // 九宫格计算
        /*
         0  1  2
         3  4  5
         6  7  8
         */
        int row = i / maxCols; // 行
        int col = i % maxCols; // 列
        
        button.x = buttonStarX + col * (xMargin + buttonW);
        button.y = buttonStarY + row * (yMargin + buttonH);
        
        
        [self addSubview:button];
    }
}

-(void)buttonClick:(UIButton *)btn{
    NSLog(@"%li",btn.tag);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
