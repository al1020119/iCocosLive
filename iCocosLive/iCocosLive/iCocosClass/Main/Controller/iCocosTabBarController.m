//
//  iCocosTabBarController.m
//  iCocos
//
//  Created by iCocos on 16/3/4.
//  Copyright © 2016年 iCocos .All rights reserved.
//

#import "iCocosTabBarController.h"
#import "iCocosNavigationController.h"

#import "iCocosMainViewController.h"

@interface iCocosTabBarController ()<iCocosTabViewDelegate>

@end


@implementation iCocosTabBarController

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
    iCocosTabView *tabView=[[iCocosTabView alloc]initWithFrame:self.tabBar.bounds];
    tabView.delegate=self;
    [self.tabBar addSubview:tabView];
    self.tabView=tabView;
}
    
#pragma mark 实现底部标签栏按钮点击的代理方法
-(void)tabView:(iCocosTabView *)tabView didSelectedFrom:(int)from toIndex:(int)to
{
    self.selectedIndex=to;
}


#pragma mark 添加子控制器
-(void)addChildVc
{
    iCocosMainViewController *message=[[iCocosMainViewController alloc]init];
    [self addChildViewController:message title:@"首页" image:@"wanxiu_home_normal" selectedImage:@"wanxiu_home_press"];
    
    //2.秀
    UITableViewController *global=[[UITableViewController alloc]init];
    [self addChildViewController:global title:@"动态" image:@"wanxiu_dynamic_normal" selectedImage:@"wanxiu_dynamic_press"];

    //4.时
    UITableViewController *car=[[UITableViewController alloc]init];
    [self addChildViewController:car title:@"消息" image:@"wanxiu_message_normal" selectedImage:@"wanxiu_message_press"];

    //5.尚
    UITableViewController *me=[[UITableViewController alloc]init];
    [self addChildViewController:me title:@"我" image:@"wanxiu_personal_normal" selectedImage:@"wanxiu_personal_press"];
    
    
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
