//
//  HGTabView.h
//  HiGo
//
//  Created by Think_lion on 15/7/25.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  iCocosTabView;


@protocol iCocosTabViewDelegate <NSObject>

@optional
-(void)tabView:(iCocosTabView*)tabView didSelectedFrom:(int)from toIndex:(int)to;

@end

@interface iCocosTabView : UIView

-(void)addTabItem:(UITabBarItem*)item;
@property (nonatomic,weak) id<iCocosTabViewDelegate>delegate;


@end
