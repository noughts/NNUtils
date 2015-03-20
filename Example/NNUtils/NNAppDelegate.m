//
//  NNAppDelegate.m
//  NNUtils
//
//  Created by CocoaPods on 03/11/2015.
//  Copyright (c) 2014 koichi yamamoto. All rights reserved.
//

#import "NNAppDelegate.h"
#import <UITableViewCell+AppearanceProxy.h>


@implementation NNAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//	[[UIView appearance] setBackgroundColor:[UIColor grayColor]];
	[UITableViewCell appearance].backgroundColor = [UIColor blackColor];
	[[UITableViewCell appearance] setTextLabelColor:[UIColor yellowColor]];
	[[UITableViewCell appearance] setDetailTextLabelColor:[UIColor colorWithWhite:1 alpha:0.5]];
	[UITableView appearance].separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
	[UITableView appearance].backgroundColor = [UIColor blackColor];
	[UINavigationBar appearance].barStyle = UIBarStyleBlackTranslucent;
	
	UIView* view = [[UIView alloc] init];
	view.backgroundColor = [UIColor darkGrayColor];
	[[UITableViewCell appearance] setSelectedBackgroundView:view];
	
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
