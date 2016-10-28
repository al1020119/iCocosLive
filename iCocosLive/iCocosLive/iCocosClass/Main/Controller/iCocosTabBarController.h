//
//  iCocosTabBarController.h
//  iCocos
//
//  Created by iCocos on 16/3/4.
//  Copyright © 2016年 iCocos .All rights reserved.
//

#import <UIKit/UIKit.h>

#import "iCocosTabView.h"
#import "iCocosTabButton.h"

@interface iCocosTabBarController : UITabBarController

@property (nonatomic,weak) iCocosTabView *tabView;

@end
