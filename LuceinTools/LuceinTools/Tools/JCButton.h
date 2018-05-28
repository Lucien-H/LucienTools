//
//  JCButton.h
//  Delivery
//
//  Created by 黄小超 on 2017/11/19.
//  Copyright © 2017年 Lucien. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JCButtonEdgeInsetsStyle) {
    JCButtonEdgeInsetsStyleTop, // image在上，label在下
    JCButtonEdgeInsetsStyleLeft, // image在左，label在右
    JCButtonEdgeInsetsStyleBottom, // image在下，label在上
    JCButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface JCButton : UIButton

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(JCButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
