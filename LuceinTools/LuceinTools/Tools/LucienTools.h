//
//  LucienTools.h
//  DeliveryForDriver
//
//  Created by 黄小超 on 2018/1/14.
//  Copyright © 2018年 Lucien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LucienTools : NSObject

/**
 * 设置字体的行间距同时修改自定范围字体颜色
 */
+(NSMutableAttributedString *)setFontColorSize:(UIFont *)fontSize WithColor:(UIColor *)color WithString:(NSString *)string WithRange:(NSRange)range;

/**
 * 设置自定范围内的字符串替换
 */
+ (NSString *)setDataWithString:(NSString *)dataStr withReplaceString:(NSString *)replaceStr WithRange:(NSRange)range;

@end
