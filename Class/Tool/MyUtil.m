//
//  MyUtil.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/26.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil

+(UILabel *)createNewLabelWithFrame:(CGRect)frame color:(UIColor *)col
{
    UILabel *label=[[UILabel alloc]initWithFrame:frame];
    label.textColor=col;
    label.layer.borderColor = col.CGColor;//边框颜色,要为CGColor
    label.layer.borderWidth = 1;
    label.layer.cornerRadius = 10;
    return label;
}

+(UILabel *)createFirstLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (title) {
        label.text = title;
    }
    if (font){
        if(is6PSinch){
            label.font = [UIFont fontWithName:@"HiraginoSansGB-W3" size:I6SPFont];
        }else{
            label.font = [UIFont fontWithName:@"HiraginoSansGB-W3" size:IothFont];
        }
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentJustified;
    // 首行缩进
    style.firstLineHeadIndent = 20.0f;
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:title attributes:@{ NSParagraphStyleAttributeName : style}];
    label.attributedText = attrText;
    label.textColor = QS_LabelTextColor;
    return label;
}

+(UILabel *)createLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (title) {
        label.text = title;
    }
    if (font){
        if(is6PSinch){
            label.font = [UIFont fontWithName:@"HiraginoSansGB-W3" size:I6SPFont];
        }else{
            label.font = [UIFont fontWithName:@"HiraginoSansGB-W3" size:IothFont];
        }
    }
    return label;
}

+(UILabel *)createCenterLabelFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    if (title) {
        label.text = title;
    }
    if (font)
    {
        if(is6PSinch){
            label.font = LFFont(I6SPFont);
        }else{
            label.font = LFFont(IothFont);
        }
    }
    return label;
}

+ (UILabel *)createLabelwithFrame:(CGRect)frame withTitle:(NSString *)title withfont:(UIFont *)font
{
    UILabel *label=[[UILabel alloc] init];
    return label;
}

+(UIImageView *)createImageView:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    return imageView;
}

+ (UIImageView *)createGifImageViewimageName:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width/2, image.size.height/2)];
    imageView.image = image;
    return imageView;
}

+(UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)color titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color) {
        [btn setBackgroundColor:color];
    }
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    if(is6PSinch){
        btn.titleLabel.font = [UIFont fontWithName:@"HiraginoSansGB-W3" size:I6SPFont_btn];
    }else{
        btn.titleLabel.font = [UIFont fontWithName:@"HiraginoSansGB-W3" size:IothFont_btn];
    }
    return btn;
}

+(UITextField *)createTextFieldFrame:(CGRect)frame placeHolder:(NSString *)placeHolder isPwd:(BOOL)isPwd pleaseColor:(UIColor *)color pleaseRadius:(CGFloat)radius
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleNone;
    if (placeHolder) {
        textField.placeholder = placeHolder;
    }
    if (isPwd) {
        textField.secureTextEntry = YES;
    }
    if (color) {
        textField.backgroundColor=color;
    }
    if (radius) {
        [textField.layer setCornerRadius:radius];
    }
    textField.tintColor = TintColor;
    
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.backgroundColor = [UIColor clearColor];
    textField.layer.borderColor = [[UIColor clearColor] CGColor];

    return textField;
}

+ (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect = CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}




@end
