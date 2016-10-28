//
//  iCocosTabView.m
//  HiGo
//
//  Created by Think_lion on 15/7/25.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import "iCocosTabView.h"
#import "iCocosTabButton.h"

@interface iCocosTabView ()

@property (nonatomic,weak) iCocosTabButton *button;

@end

@implementation iCocosTabView

/**
 *  初始化
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self){
        
        [self removeTabBarItems];
        
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
-(void)removeTabBarItems{
    for (UITabBarItem *barItem in self.subviews) {
//        barItem.enabled = NO;
        barItem.titlePositionAdjustment = UIOffsetMake(0, 64);
    }
}

/**
 *  增加Item按钮
 */
-(void)addTabItem:(UITabBarItem *)item
{
    iCocosTabButton *tabButton=[[iCocosTabButton alloc]init];
    tabButton.item=item;
    [tabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:tabButton];
    
    //如果是第一个的话  就选中
    if(self.subviews.count == 1){
        [self tabButtonClick:tabButton];
    }
}
 

#pragma mark 按钮的点击事件
-(void)tabButtonClick:(iCocosTabButton*)sender
{
    self.button.selected=NO;
    sender.selected=YES;
    self.button=sender;
    
    if([self.delegate respondsToSelector:@selector(tabView:didSelectedFrom:toIndex:)]){
        [self.delegate tabView:self didSelectedFrom:(int)self.button.tag toIndex:(int)sender.tag];
    }
}


/**
 *  布局子控件
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    int count=(int)self.subviews.count;
    CGFloat btnY=0;
    CGFloat btnX=0;
    CGFloat btnH=self.frame.size.height;
    CGFloat btnW=[UIScreen mainScreen].bounds.size.width/count;
    for(int i=0;i<count;i++){
        btnX=i*btnW;
        iCocosTabButton *btn=self.subviews[i];
        btn.tag=i;
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
    }
}


@end
