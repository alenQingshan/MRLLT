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
    NSInteger lie = 3;
    NSInteger hang = self.mbuttunArray.count/lie;
    CGFloat buttonwidth = (Screen_width-80)/lie;
    CGFloat buttonhidth = 40;
    
    for (int i = 0; i < _mbuttunArray.count; i++) {
        CGFloat jianxi = Screen_width - (lie * buttonwidth)/(lie - 1);
        CGFloat rowjianxi = jianxi;
        NSInteger row = hang;
        CGFloat shopY = row * (buttonhidth +rowjianxi);
        int col = hang % 3;
        CGFloat shopX = col * (buttonwidth *jianxi);
        
        UIButton *button = [MyUtil createBtnFrame:CGRectMake(shopX, shopY, buttonwidth, buttonhidth) title:self.mbuttunArray[i] backgroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] target:self action:@selector(buttonClick:)];
        button.tag = 100+i;
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
