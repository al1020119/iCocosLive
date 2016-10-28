//
//  UITabBar+iCocosTabBarBadgeTips.h
//  iCocos
//
//  Created iCocos on 16/3/27.
//  Copyright © 2016年 iCocos .All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (iCocosTabBarBadgeTips)

- (void)showBadgeOnItemIndex:(int)index;


- (void)hideBadgeOnItemIndex:(int)index;

    
- (void)removeBadgeOnItemIndex:(int)index;
    
    
@end
