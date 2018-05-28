//
//  LucienTools.m
//  DeliveryForDriver
//
//  Created by 黄小超 on 2018/1/14.
//  Copyright © 2018年 Lucien. All rights reserved.
//

#import "LucienTools.h"
static LucienTools *shareTool;

@implementation LucienTools

/**
 *  创建单例
 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{     //该方法只执行一次，且能保证线程安全
        shareTool = [[LucienTools alloc] init];
    });
    return shareTool;
}

#pragma mark - 设置字体的行间距同时修改自定范围字体颜色
+(NSMutableAttributedString *)setFontColorSize:(UIFont *)fontSize WithColor:(UIColor *)color WithString:(NSString *)string WithRange:(NSRange)range
{
    NSMutableAttributedString * as = [[NSMutableAttributedString alloc]   initWithString:string];
    [as addAttribute:NSFontAttributeName value:fontSize range:range];
    [as addAttribute:NSForegroundColorAttributeName value:color range:range];
    return as;
}

#pragma mark - 设置自定范围内的字符串替换
+ (NSString *)setDataWithString:(NSString *)dataStr withReplaceString:(NSString *)replaceStr WithRange:(NSRange)range{
    NSString *str = [dataStr stringByReplacingCharactersInRange:range withString:replaceStr];
    return str;
}

@end
