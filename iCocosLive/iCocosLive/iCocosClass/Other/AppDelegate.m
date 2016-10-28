//
//  AppDelegate.m
//  iCocosLive
//
//  Created by tqy on 16/10/28.
//  Copyright © 2016年 iCocos. All rights reserved.
//

#import "AppDelegate.h"
#import "iCocosTabBarController.h"

#import "WSMovieController.h"

#import "SRNewFeaturesViewController.h"

#import "WZXLaunchViewController.h"
#import "HomeAddShowWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    NSString *show = @"2";
    if ([show isEqualToString:@"0"]) {
        
        //如果当前控制器,与保存版本控制器相同
        BOOL shouldShow = [WSMovieController sr_shouldShowNewFeature];
        if (shouldShow) {
            
            //是第一次
            WSMovieController *wsCtrl = [[WSMovieController alloc]init];
            wsCtrl.movieURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"qidong"ofType:@"mp4"]];
            self.window.rootViewController = wsCtrl;
            [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"isFirstLogin"];
        } else {
            
            // 2.设置窗口的根控制器
            [iCocosSwitchInterfaceHandler switchInterfaceToWindow:self.window];
        }
    } else if ([show isEqualToString:@"1"]) {
        
        //如果当前控制器,与保存版本控制器相同
        BOOL shouldShow = [SRNewFeaturesViewController sr_shouldShowNewFeature];
        if (shouldShow) {
            
            iCocosTabBarController *viewCtrl = [[iCocosTabBarController alloc]init];
            NSArray *imageNames = @[@"newfeature1.png", @"newfeature2.png", @"newfeature3.png"];
            SRNewFeaturesViewController *newFeaturesVC = [SRNewFeaturesViewController sr_newFeatureWithImageNames:imageNames
                                                                                               rootViewController:viewCtrl];
            newFeaturesVC.hideSkipButton = NO; // show skip Button
            self.window.rootViewController = newFeaturesVC;
        } else {
            
            // 2.设置窗口的根控制器
            [iCocosSwitchInterfaceHandler switchInterfaceToWindow:self.window];
        }
    }  else if ([show isEqualToString:@"2"]) {
        
        NSString *gifImageURL = @"http://img1.gamedog.cn/2013/06/03/43-130603140F30.gif";
        //NSString *imageURL = @"http://img4.duitang.com/uploads/item/201410/24/20141024135636_t2854.thumb.700_0.jpeg";
        ///设置启动页
        [WZXLaunchViewController showWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) ImageURL:gifImageURL advertisingURL:@"http://www.jianshu.com/p/7205047eadf7" timeSecond:10 hideSkip:YES imageLoadGood:^(UIImage *image, NSString *imageURL) {
            
            /// 广告加载结束
            NSLog(@"%@ %@",image,imageURL);
        } clickImage:^(UIViewController *WZXlaunchVC){
            
            //2.在webview中打开
            HomeAddShowWebViewController *VC = [[HomeAddShowWebViewController alloc] init];
            VC.urlStr = @"http://www.jianshu.com/p/7205047eadf7";
            VC.title = @"广告";
            VC.AppDelegateSele= -1;
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:VC];
            [WZXlaunchVC presentViewController:nav animated:YES completion:nil];
        } theAdEnds:^{
            
            // 2.设置窗口的根控制器
            [iCocosSwitchInterfaceHandler switchInterfaceToWindow:self.window];
        }];
    } else {
        
        // 2.设置窗口的根控制器
        [iCocosSwitchInterfaceHandler switchInterfaceToWindow:self.window];
    }
    
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"iCocosLive"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
