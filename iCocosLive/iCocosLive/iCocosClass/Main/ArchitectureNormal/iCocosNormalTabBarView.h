//
//  HGTabView.h
//  HiGo
//
//  Created by Think_lion on 15/7/25.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  iCocosNormalTabBarView;


@protocol iCocosTabBarViewDelegate <NSObject>

@optional
-(void)tabView:(iCocosNormalTabBarView*)tabView didSelectedFrom:(int)from toIndex:(int)to;

@end

@interface iCocosNormalTabBarView : UIView

-(void)addTabItem:(UITabBarItem*)item;
@property (nonatomic,weak) id<iCocosTabBarViewDelegate>delegate;


@end
