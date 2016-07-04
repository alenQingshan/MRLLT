//
//  UIButton+Extension.m
//  蝉游记
//
//  Created by loverui on 15/7/16.
//  Copyright (c) 2015年 loverui. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
+(UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
