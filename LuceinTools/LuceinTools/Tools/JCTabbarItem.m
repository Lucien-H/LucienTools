//
//  JCTabbarItem.m
//  Delivery
//
//  Created by 黄小超 on 2017/11/18.
//  Copyright © 2017年 Lucien. All rights reserved.
//

#import "JCTabbarItem.h"

@implementation JCTabbarItem

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.selectedImage = [self.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:102/255 green:102/255 blue:102/255 alpha:1]} forState:UIControlStateNormal];
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:253/255 green:100/255 blue:7/255 alpha:1]} forState:UIControlStateSelected];
    }
    return self;
}

@end
