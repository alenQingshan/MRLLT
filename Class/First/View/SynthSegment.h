//
//  SynthSegment.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/6/7.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SynthDelegate <NSObject>

@optional

- (void)scrollToPage:(int)page;

@end
@interface SynthSegment : UIView

@property (nonatomic,weak) id<SynthDelegate>delegate;
@property (nonatomic,assign) CGFloat maxWidth;
@property (nonatomic,strong) NSMutableArray *titleList;
@property (nonatomic,strong) NSMutableArray *buttonList;
@property (nonatomic,weak) CALayer *LGLayer;
@property (nonatomic,assign) CGFloat bannerNowX;

- (id)initWithFrame:(CGRect)frame withObject:(NSArray *)arr;
- (void)moveToOffsetX:(CGFloat)X;

@end