//
//  iCocosTabBarController.h
//  iCocos
//
//  Created by iCocos on 16/3/4.
//  Copyright © 2016年 iCocos .All rights reserved.
//

#import <UIKit/UIKit.h>

#import "iCocosNormalTabBarView.h"
#import "iCocosNormalTabBarButton.h"

@interface iCocosNormalTabBarController : UITabBarController

@property (nonatomic,weak) iCocosNormalTabBarView *tabView;

@end
