//
//  BodyView.h
//  MRLLT
//
//  Created by 刘青山 on 16/7/4.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyView : UIView<UITextFieldDelegate>

@property (nonatomic,strong)NSMutableArray *mbuttunArray;
@property (nonatomic,strong)UITextField *userIDField;//用户名

@end
