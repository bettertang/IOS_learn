//
//  AppDelegate.m
//  SampleApp
//
//  Created by better_yst on 2021/8/11.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CollectionViewController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *mytabbarcon = [[UITabBarController alloc] init];
    
    self.myviewcontroler = [[ViewController alloc] init];
    
   
    
//    UIViewController *view1 = [[UIViewController alloc] init];
//    view1.view.backgroundColor = [UIColor redColor];
    self.myviewcontroler.tabBarItem.title = @"Navitagion";
    
    CollectionViewController *collectionVC = [[CollectionViewController alloc] init];
    //collectionVC.view.backgroundColor = [UIColor blueColor];
    
    [mytabbarcon setViewControllers:@[self.myviewcontroler,collectionVC]];
    
    mytabbarcon.delegate =self;
    
     UINavigationController *mynavigationCon = [[UINavigationController alloc] initWithRootViewController:mytabbarcon];
    self.window.rootViewController = mynavigationCon;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"Did select and change vc");
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
