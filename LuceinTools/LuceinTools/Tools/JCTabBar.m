//
//  JCTabBar.m
//  Delivery
//
//  Created by 黄小超 on 2017/11/18.
//  Copyright © 2017年 Lucien. All rights reserved.
//

#import "JCTabBar.h"
#import "AppDelegate.h"

@implementation JCTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger index = 0;
    CGFloat space = 12;
    CGFloat tabBarLabelHeight = 16;
    
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        self.selectionIndicatorImage = [[UIImage alloc] init];
        [self bringSubviewToFront:button];
        UIView *tabBarImageView, *tabBarLabel, *tabBarBadgeView;
        
        for (UIView *subview in button.subviews) {
            if ([subview isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                tabBarImageView = subview;
            } else if ([subview isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
                tabBarLabel = subview;
            } else if ([subview isKindOfClass:NSClassFromString(@"_UIBadgeView")]) {
                tabBarBadgeView = subview;
            }
        }
        NSString *tabBarLabelText = ((UILabel *)tabBarLabel).text;
        CGFloat y = CGRectGetHeight(self.bounds) - (CGRectGetHeight(tabBarLabel.bounds) + CGRectGetHeight(tabBarImageView.bounds));
//        NSLog(@"=======%f ======= %f", button.frame.origin.x, button.frame.size.width);
        if (y < 0) {
            if (!tabBarLabelText.length) {
                space -= tabBarLabelHeight;
            } else {
                space = 12;
            }
            button.frame = CGRectMake(button.frame.origin.x, y - space, button.frame.size.width, button.frame.size.height - y + space);
        } else {
            space = MIN(space, y);
        }
        
        index++;
    }
    
}

// 解决超出边界无响应事件的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
        UIView *result = [super hitTest:point withEvent:event];
        if (result) {
            return result;
        } else {
            for (UIView *subView in self.subviews.reverseObjectEnumerator) {
                CGPoint subPoint = [subView convertPoint:point fromView:self];
                if (CGRectContainsPoint(subView.bounds, subPoint)) {
                    result = subView;
                    return result;
                }
            }
        }
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    
    NSInteger tabCount = 0;
    for (UIView *subView in self.subviews) {
        if (![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        tabCount++;
    }
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width / tabCount;
    NSUInteger clickIndex = ceil(point.x) / ceil(width);
    
    UITabBarController *tabVC = (UITabBarController *)[(AppDelegate *)[[UIApplication sharedApplication] delegate] window].rootViewController;
    [tabVC setSelectedIndex:clickIndex];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
