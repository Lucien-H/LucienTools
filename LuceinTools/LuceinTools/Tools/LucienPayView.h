//
//  LucienPayView.h
//  DeliveryForDriver
//
//  Created by 黄小超 on 2018/1/29.
//  Copyright © 2018年 Lucien. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LucienPayView;
@protocol LucienPayViewDelegate<NSObject>
-(void)LucienPayView:(LucienPayView *)view WithPasswordString:(NSString *)Password;
@end
@interface LucienPayView : UIView<UITextFieldDelegate>
//代理
@property (nonatomic,weak)id <LucienPayViewDelegate> payPasswordDelegate;
// 初始化
- (id)initWithFrame:(CGRect)frame WithTitle:(NSString *)title WithSubTitle:(NSString *)subTitle;
//隐藏所有的密码点
- (void)hiddenAllPoint;
//移除所有控件
- (void)removeFromView;
///标题
@property (nonatomic,strong)UILabel *lable_title;
///二级标题
@property (nonatomic,strong)UILabel *lable_subTitle;
//真正接受密码输入的框   看不见
@property (nonatomic,strong)UITextField *TF;
//  可见的输入框
@property (nonatomic,strong)UIView *view_box1;
@property (nonatomic,strong)UIView *view_box2;
@property (nonatomic,strong)UIView *view_box3;
@property (nonatomic,strong)UIView *view_box4;
@property (nonatomic,strong)UIView *view_box5;
@property (nonatomic,strong)UIView *view_box6;
//   密码点
@property (nonatomic,strong)UILabel *lable_point1;
@property (nonatomic,strong)UILabel *lable_point2;
@property (nonatomic,strong)UILabel *lable_point3;
@property (nonatomic,strong)UILabel *lable_point4;
@property (nonatomic,strong)UILabel *lable_point5;
@property (nonatomic,strong)UILabel *lable_point6;
@end
