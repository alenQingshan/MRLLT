//
//  MyUtil.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/26.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUtil : NSObject

//首行缩进的label
+(UILabel *)createFirstLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

//创建带边框的
+(UILabel *)createNewLabelWithFrame:(CGRect)frame color:(UIColor *)col;

//创建label
+ (UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

//创建labelAlegmentCenter
+(UILabel *)createCenterLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font;

//创建UIImageView
+ (UIImageView *)createImageView:(CGRect)frame imageName:(NSString *)imageName;

//创建gif图片
+ (UIImageView *)createGifImageViewimageName:(UIImage *)image;

//按钮
+(UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)color titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

//输入框
+(UITextField *)createTextFieldFrame:(CGRect)frame placeHolder:(NSString *)placeHolder isPwd:(BOOL)isPwd pleaseColor:(UIColor *)color pleaseRadius:(CGFloat)radius;

//颜色转图片
+ (UIImage*) createImageWithColor: (UIColor*) color;

@end
