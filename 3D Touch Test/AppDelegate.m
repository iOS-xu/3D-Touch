//
//  AppDelegate.m
//  3D Touch Test
//
//  Created by MJRB on 2017/12/5.
//  Copyright © 2017年 szsxrkj. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DetailViewController.h"
@interface AppDelegate ()
@property (nonatomic,strong)ViewController * viewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor =[UIColor whiteColor];
    _viewController =[[ViewController alloc]init];
    UINavigationController *navigationController =[[UINavigationController alloc]initWithRootViewController:_viewController];
    self.window.rootViewController =navigationController;
    [self.window makeKeyAndVisible];
    
    UIMutableApplicationShortcutItem * item1 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"num1" localizedTitle:@"方块A" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLocation] userInfo:nil];
    UIMutableApplicationShortcutItem * item2 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"num2" localizedTitle:@"梅花Q" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay] userInfo:nil];
    UIMutableApplicationShortcutItem * item3 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"num3" localizedTitle:@"黑桃J" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAudio] userInfo:nil];
    UIMutableApplicationShortcutItem * item4 = [[UIMutableApplicationShortcutItem alloc] initWithType:@"num4" localizedTitle:@"红桃K" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
     [UIApplication sharedApplication].shortcutItems = @[item4,item3,item2,item1];
    
    if ([launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey]) {
        
        UIApplicationShortcutItem *tempItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
        
        DetailViewController *vc =[[DetailViewController alloc]init];
        
        if ([tempItem.type isEqualToString:@"num1"]) {
            
            vc.imageViewStr  = @"1.jpg";
            
        }else if([tempItem.type isEqualToString:@"num2"]) {
            
            vc.imageViewStr   = @"2.jpg";
            
        }else if([tempItem.type isEqualToString:@"num3"]) {
            
            vc.imageViewStr  = @"3.jpg";
            
        }else if([tempItem.type isEqualToString:@"num4"]) {
            
            vc.imageViewStr   = @"4.jpg";
            
        }
        
        [_viewController.navigationController pushViewController:vc animated:NO];
        
        return NO;
    }

    
    
    
    return YES;
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    [_viewController.navigationController popToRootViewControllerAnimated:NO];
    _viewController.pushStr =shortcutItem.type;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushDetail" object:nil];

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
}


@end
