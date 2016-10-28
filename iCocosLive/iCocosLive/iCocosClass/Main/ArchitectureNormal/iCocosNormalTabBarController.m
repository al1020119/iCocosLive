//
//  iCocosTabBarController.m
//  iCocos
//
//  Created by iCocos on 16/3/4.
//  Copyright © 2016年 iCocos .All rights reserved.
//

#import "iCocosNormalTabBarController.h"
#import "iCocosNavigationController.h"

#import "iCocosMainViewController.h"

@interface iCocosNormalTabBarController ()<iCocosTabBarViewDelegate>

@end


@implementation iCocosNormalTabBarController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for(UIView *zv in self.tabBar.subviews){
        if([zv isKindOfClass:[UIControl class]]){
            [zv removeFromSuperview];
        }
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加底部自定义的标签栏
    [self setupTabBar];
    //2.添加子控制器
    [self addChildVc];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBrandsNillToHomeModel) name:@"clickBrandsNillToHomeModelNotification" object:nil];
    
}

- (void)clickBrandsNillToHomeModel
{
    self.selectedIndex=0;
}


- (void)willAutoReconnect
{
    
    iCocosLog(@"%s", __func__);
}

#pragma mark 添加底部的标签栏
-(void)setupTabBar
{
    iCocosNormalTabBarView *tabView=[[iCocosNormalTabBarView alloc]initWithFrame:self.tabBar.bounds];
    tabView.delegate=self;
    [self.tabBar addSubview:tabView];
    self.tabView=tabView;
}
    
#pragma mark 实现底部标签栏按钮点击的代理方法
-(void)tabView:(iCocosNormalTabBarView *)tabView didSelectedFrom:(int)from toIndex:(int)to
{
    self.selectedIndex=to;
}


#pragma mark 添加子控制器
-(void)addChildVc
{
    iCocosMainViewController *message=[[iCocosMainViewController alloc]init];
    [self addChildViewController:message title:@"首页" image:@"binbin_tab_plaza_normal" selectedImage:@"binbin_tab_plaza_selected"];
    
    //2.秀
    UITableViewController *global=[[UITableViewController alloc]init];
    [self addChildViewController:global title:@"动态" image:@"binbin_tab_follow_normal" selectedImage:@"binbin_tab_follow_selected"];

    //5.尚
    UITableViewController *msg=[[UITableViewController alloc]init];
    [self addChildViewController:msg title:@"私信" image:@"binbin_tab_chat_normal" selectedImage:@"binbin_tab_chat_selected"];
    
    //5.尚
    UITableViewController *me=[[UITableViewController alloc]init];
    [self addChildViewController:me title:@"我的" image:@"binbin_tab_me_normal" selectedImage:@"binbin_tab_me_selected"];
    
    
}

#pragma mark 添加子控制器的方法
-(void)addChildViewController:(UIViewController *)childVc title:(NSString*)title image:(NSString*)image selectedImage:(NSString*)selectedImage
{
//    childVc.navigationItem.title=title;
    childVc.tabBarItem.image=[UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
    
    iCocosNavigationController *nav=[[iCocosNavigationController alloc]initWithRootViewController:childVc];
    
    nav.tabBarItem.title = title;
    
    [self addChildViewController:nav];
    
    [self.tabView addTabItem:childVc.tabBarItem];
}

@end
