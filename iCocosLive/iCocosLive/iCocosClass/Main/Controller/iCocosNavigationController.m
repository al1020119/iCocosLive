//
//  iCocosNavigationController.m
//  iCocos
//
//  Created by iCocos on 16/3/4.
//  Copyright © 2016年 iCocos .All rights reserved.
//

#import "iCocosNavigationController.h"

@interface iCocosNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation iCocosNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.navigationBar.tintColor = [UIColor whiteColor];//如果要不同item不同颜色，那么item要带一个自定义按钮，在设置按钮属性
    
    // 设置标题文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    barAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [self.navigationBar setTitleTextAttributes:barAttrs];
}

/**
 *  删除TabBar上的UITabBarButton
 */
-(void)moreMore
{
    for (UIView *tabBarButton in self.tabBarController.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"moreMore" object:nil];
    
    //控制器销毁的时候，必须移除通知，不然会产生意外的崩溃：通知满天飞
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


+ (void)initialize
{
    /** 设置UINavigationBar */
    UINavigationBar *bar = [UINavigationBar appearance];
    
    // 设置标题文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSForegroundColorAttributeName] = [UIColor purpleColor];
    barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    [bar setTitleTextAttributes:barAttrs]; 
    
    /** 设置UIBarButtonItem */
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // UIControlStateNormal
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
//    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#f23064"];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    
    // UIControlStateDisabled
    NSMutableDictionary *disabledAttrs = [NSMutableDictionary dictionary];
    disabledAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:disabledAttrs forState:UIControlStateDisabled];
}

/**
 * 拦截所有push进来的子控制器
 * @param viewController 每一次push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if (不是第一个push进来的子控制器) {
    if (self.childViewControllers.count >= 1) {
        // 左上角的返回
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 30, 30);
        [backButton setImage:[UIImage imageNamed:@"wanxiu_gerenzhongxin_back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"wanxiu_gerenzhongxin_back"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"wanxiu_gerenzhongxin_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 如果当前显示的是第一个子控制器,就应该禁止掉[返回手势]
    //    if (self.childViewControllers.count == 1) return NO;
    //    return YES;
    return self.childViewControllers.count > 1;
}

@end
