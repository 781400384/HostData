//
//  AppDelegate.m
//  DrinkWater
//
//  Created by 纪明 on 2020/2/16.
//  Copyright © 2020 纪明. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   MainViewController  *  vc=[[MainViewController alloc]init];
       BaseNavigationController  *  nav=[[BaseNavigationController alloc]initWithRootViewController:vc];
                              self.window.rootViewController = nav;
                [self.window makeKeyAndVisible];
    return YES;
}




@end
