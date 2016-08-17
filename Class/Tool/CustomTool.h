//
//  CustomTool.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/7.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <Foundation/Foundation.h>

//所有的公共方法都放在这里
@interface CustomTool : NSObject

+ (CGFloat)diskOfAllSizeMBytes;

+ (CGFloat)diskOfFreeSizeMBytes;

+ (long long)fileSizeAtPath:(NSString *)filePath;

+ (long long)folderSizeAtPath:(NSString *)folderPath;

+ (NSString *)firstCharacterWithString:(NSString *)string;

+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array;

+ (NSString *)currentDateWithFormat:(NSString *)format;

+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime lastTimeFormat:(NSString *)format1 ToCurrentTime:(NSString *)currentTime currentTimeFormat:(NSString *)format2;

+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime ToCurrentTime:(NSDate *)currentTime;

+ (BOOL)valiMobile:(NSString *)mobile;

+ (BOOL)isAvailableEmail:(NSString *)email;

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIImage *)filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;

+ (UIImage *)blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;

+ (UIImage *)colorControlsWithOriginalImage:(UIImage *)image saturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast;

+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame;

+ (UIImage *)shotScreen;

+ (UIImage *)shotWithView:(UIView *)view;

+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope;

+ (UIImage *)compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

+ (NSString *)getIPAddress;

+ (BOOL)isHaveSpaceInString:(NSString *)string;

+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2;

+ (BOOL)isHaveChineseInString:(NSString *)string;

+ (BOOL)PureLetters:(NSString*)str;//判断字符串是否全部为字母

+ (BOOL)isAllNum:(NSString *)string;

+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame lineLength:(int)length lineSpacing:(int)spacing lineColor:(UIColor *)color;

+ (NSString *)replaceNullValue: (NSString *)string;

+ (NSDate *)dateWithTimeStamp:(NSString *)timeStamp;

+ (NSInteger)cTimestampFromDate:(NSDate *)date;

+ (NSInteger)cTimestampFromDate;

+(NSString *)time:(NSDate *)date;

+ (UIImage *)saImageWithSingleColor:(UIColor *)color;

+(NSString *)md5:(NSString *)str;

+(NSMutableDictionary *)returnParamet;

+(NSString*)encodeBase64String:(NSString * )input;

+ (NSString *)isBlankString:(NSString *)string;

+ (UIViewController *)getCurrentVC;
#pragma mark - 上传图片压缩
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

+ (UIImage *)createRRcode:(NSString *)str;//生成二维码
@end
