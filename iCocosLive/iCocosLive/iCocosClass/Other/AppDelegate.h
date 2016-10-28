//
//  AppDelegate.h
//  iCocosLive
//
//  Created by tqy on 16/10/28.
//  Copyright © 2016年 iCocos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

