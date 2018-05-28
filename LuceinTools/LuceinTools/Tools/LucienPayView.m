//
//  LucienPayView.m
//  DeliveryForDriver
//
//  Created by 黄小超 on 2018/1/29.
//  Copyright © 2018年 Lucien. All rights reserved.
//

#import "LucienPayView.h"
#define  boxWidth  40          //密码框的宽度
#define defaultBGColor [UIColor colorWithRed:248.0f/255.0f green:248.0f/255.0f blue:248.0f/255.0f alpha:1.0f]
#define lineColor [UIColor lightGrayColor]
#define textRedColor [UIColor redColor]
@implementation LucienPayView

//不带按钮
- (id)initWithFrame:(CGRect)frame WithTitle:(NSString *)title WithSubTitle:(NSString *)subTitle{
    self = [super initWithFrame:frame];// 先调用父类的initWithFrame方法
    if (self) {
        [self setupUIWithTitle:title WithSubTitle:subTitle];
    }
    return self;
}

-(void)setupUIWithTitle:(NSString *)title WithSubTitle:(NSString *)subTitle{
    //蒙版
    UIView *viewBG = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, kHeight)];
    viewBG.backgroundColor = [UIColor blackColor];
    viewBG.alpha = 0.2;
    viewBG.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeFromView)];
    [viewBG addGestureRecognizer:tap];
    [self addSubview:viewBG];
    //输入密码View
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake((KWidth-275)/2, (kHeight - 200) / 2, 275, 158)];
    [view.layer setCornerRadius:3];
    [view.layer setMasksToBounds:YES];
    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    [self addSubview:view];
    
    ///标题
    _lable_title = [[UILabel alloc]init];
    _lable_title.frame = CGRectMake(10, 20, view.frame.size.width-20, 15);
    _lable_title.text = [NSString stringWithFormat:@"%@",title];
    _lable_title.textAlignment=1;
    _lable_title.font = kGetSystemFont(17);
    _lable_title.textColor = [UIColor darkGrayColor];
    [view addSubview:_lable_title];
    
    ///二级标题
    _lable_subTitle = [[UILabel alloc]init];
    _lable_subTitle.frame = CGRectMake(10, _lable_title.frame.origin.y+_lable_title.frame.size.height+20, view.frame.size.width-20, 20);
     NSAttributedString *attributedStr = [LucienTools setFontColorSize:kGetSystemFont(33) WithColor:kGetColor(51, 51, 51) WithString:subTitle WithRange:NSMakeRange(0, subTitle.length - 1)];
    _lable_subTitle.attributedText = attributedStr;
    _lable_subTitle.textAlignment=1;
//    _lable_subTitle.font = kGetSystemFont(14);
    _lable_subTitle.textColor = kGetColor(51, 51, 51);
    [view addSubview:_lable_subTitle];
    if([[NSString stringWithFormat:@"%@",subTitle] isEqualToString:@""]) {
        _lable_subTitle.frame = CGRectMake(10, _lable_title.frame.origin.y+_lable_title.frame.size.height, view.frame.size.width-20, 0);
    }
    ///  TF
    _TF = [[UITextField alloc]init];
    _TF.frame = CGRectMake(0, 0, 0, 0);
    _TF.delegate = self;
    _TF.keyboardType=UIKeyboardTypeNumberPad;
    [_TF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [view addSubview:_TF];
    
    ///  假的输入框
    _view_box1 = [[UIView alloc]initWithFrame:CGRectMake((view.frame.size.width-boxWidth*6)/2, CGRectGetMaxY(_lable_subTitle.frame)+20, boxWidth, boxWidth)];
    [_view_box1.layer setBorderWidth:0.5];
    _view_box1.backgroundColor = defaultBGColor;
    _view_box1.layer.borderColor = [lineColor CGColor];
    [view addSubview:_view_box1];
    
    _view_box2 = [[UIView alloc]initWithFrame:CGRectMake((view.frame.size.width-boxWidth*6)/2+boxWidth*1-0.5, _view_box1.frame.origin.y, boxWidth, boxWidth)];
    _view_box2.backgroundColor = defaultBGColor;
    [_view_box2.layer setBorderWidth:0.5];
    _view_box2.layer.borderColor = [lineColor CGColor];
    [view addSubview:_view_box2];
    
    _view_box3 = [[UIView alloc]initWithFrame:CGRectMake((view.frame.size.width-boxWidth*6)/2+boxWidth*2-1, _view_box1.frame.origin.y, boxWidth, boxWidth)];
    [_view_box3.layer setBorderWidth:0.5];
    _view_box3.backgroundColor = defaultBGColor;
    _view_box3.layer.borderColor = [lineColor CGColor];
    [view addSubview:_view_box3];
    
    _view_box4 = [[UIView alloc]initWithFrame:CGRectMake((view.frame.size.width-boxWidth*6)/2+boxWidth*3-1.5, _view_box1.frame.origin.y, boxWidth, boxWidth)];
    [_view_box4.layer setBorderWidth:0.5];
    _view_box4.backgroundColor = defaultBGColor;
    _view_box4.layer.borderColor = [lineColor CGColor];
    [view addSubview:_view_box4];
    
    _view_box5 = [[UIView alloc]initWithFrame:CGRectMake((view.frame.size.width-boxWidth*6)/2+boxWidth*4-2, _view_box1.frame.origin.y, boxWidth, boxWidth)];
    [_view_box5.layer setBorderWidth:0.5];
    _view_box5.backgroundColor = defaultBGColor;
    _view_box5.layer.borderColor = [lineColor CGColor];
    [view addSubview:_view_box5];
    
    _view_box6 = [[UIView alloc]initWithFrame:CGRectMake((view.frame.size.width-boxWidth*6)/2+boxWidth*5-2.5, _view_box1.frame.origin.y, boxWidth, boxWidth)];
    [_view_box6.layer setBorderWidth:0.5];
    _view_box6.backgroundColor = defaultBGColor;
    _view_box6.layer.borderColor = [lineColor CGColor];
    [view addSubview:_view_box6];
    
    
    ///   密码点
    _lable_point1 = [[UILabel alloc]init];
    _lable_point1.frame = CGRectMake((_view_box1.frame.size.width-10)/2, (_view_box1.frame.size.width-10)/2, 10, 10);
    [_lable_point1.layer setCornerRadius:5];
    [_lable_point1.layer setMasksToBounds:YES];
    _lable_point1.backgroundColor = [UIColor blackColor];
    [_view_box1 addSubview:_lable_point1];
    
    _lable_point2 = [[UILabel alloc]init];
    _lable_point2.frame = CGRectMake((_view_box1.frame.size.width-10)/2, (_view_box1.frame.size.width-10)/2, 10, 10);
    [_lable_point2.layer setCornerRadius:5];
    [_lable_point2.layer setMasksToBounds:YES];
    _lable_point2.backgroundColor = [UIColor blackColor];
    [_view_box2 addSubview:_lable_point2];
    
    
    _lable_point3 = [[UILabel alloc]init];
    _lable_point3.frame = CGRectMake((_view_box1.frame.size.width-10)/2, (_view_box1.frame.size.width-10)/2, 10, 10);
    [_lable_point3.layer setCornerRadius:5];
    [_lable_point3.layer setMasksToBounds:YES];
    _lable_point3.backgroundColor = [UIColor blackColor];
    [_view_box3 addSubview:_lable_point3];
    
    _lable_point4 = [[UILabel alloc]init];
    _lable_point4.frame = CGRectMake((_view_box1.frame.size.width-10)/2, (_view_box1.frame.size.width-10)/2, 10, 10);
    [_lable_point4.layer setCornerRadius:5];
    [_lable_point4.layer setMasksToBounds:YES];
    _lable_point4.backgroundColor = [UIColor blackColor];
    [_view_box4 addSubview:_lable_point4];
    
    _lable_point5 = [[UILabel alloc]init];
    _lable_point5.frame = CGRectMake((_view_box1.frame.size.width-10)/2, (_view_box1.frame.size.width-10)/2, 10, 10);
    [_lable_point5.layer setCornerRadius:5];
    [_lable_point5.layer setMasksToBounds:YES];
    _lable_point5.backgroundColor = [UIColor blackColor];
    [_view_box5 addSubview:_lable_point5];
    
    _lable_point6 = [[UILabel alloc]init];
    _lable_point6.frame = CGRectMake((_view_box1.frame.size.width-10)/2, (_view_box1.frame.size.width-10)/2, 10, 10);
    [_lable_point6.layer setCornerRadius:5];
    [_lable_point6.layer setMasksToBounds:YES];
    _lable_point6.backgroundColor = [UIColor blackColor];
    [_view_box6 addSubview:_lable_point6];
    
    _lable_point1.hidden=YES;
    _lable_point2.hidden=YES;
    _lable_point3.hidden=YES;
    _lable_point4.hidden=YES;
    _lable_point5.hidden=YES;
    _lable_point6.hidden=YES;
}

- (void) textFieldDidChange:(UITextField*) sender {
    UITextField *_field = sender;
    switch (_field.text.length) {
        case 0:{
            _lable_point1.hidden=YES;
            _lable_point2.hidden=YES;
            _lable_point3.hidden=YES;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 1:{
            _lable_point1.hidden=NO;
            _lable_point2.hidden=YES;
            _lable_point3.hidden=YES;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 2:{
            _lable_point1.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=YES;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 3:{
            _lable_point1.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=YES;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 4:{
            _lable_point1.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=YES;
            _lable_point6.hidden=YES;
        }
            break;
        case 5:{
            _lable_point1.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=YES;
        }
            break;
        case 6:{
            _lable_point1.hidden=NO;
            _lable_point2.hidden=NO;
            _lable_point3.hidden=NO;
            _lable_point4.hidden=NO;
            _lable_point5.hidden=NO;
            _lable_point6.hidden=NO;
        }
            break;
        default:
            break;
    }
    if (_field.text.length==6) {
        [self.payPasswordDelegate  LucienPayView:self WithPasswordString:_field.text];
        [self removeFromView];
    }else {//非自动验证
        if(_field.text.length>6){
            //截取前6个字符
            _field.text = [_field.text substringToIndex:6];
        }
    }
}
- (void)hiddenAllPoint {
    _lable_point1.hidden=YES;
    _lable_point2.hidden=YES;
    _lable_point3.hidden=YES;
    _lable_point4.hidden=YES;
    _lable_point5.hidden=YES;
    _lable_point6.hidden=YES;
}
- (void)removeFromView {
    [self removeFromSuperview];
}
- (void)dealloc {
    NSLog(@"dealloc");
}
@end
