//
//  NSString+Extension.h
//  正则表达式
//
//  Created by apple on 14/11/15.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
- (BOOL)isQQ; //qq
- (BOOL)isPhoneNumber; // 电话
- (BOOL)isIPAddress; //IP地址
- (BOOL)isIdcard; // 身份证
- (BOOL)isChinese ; //中文
- (BOOL)isEnglishChinese;//中文或英文
- (BOOL)iSNumber; //是数字
- (BOOL)iSNumber_English;

@end
