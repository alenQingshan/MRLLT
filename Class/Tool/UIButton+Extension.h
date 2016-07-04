//
//  UIButton+Extension.h
//  蝉游记
//
//  Created by loverui on 15/7/16.
//  Copyright (c) 2015年 loverui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
+(UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;
@end
