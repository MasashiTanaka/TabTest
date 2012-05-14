//
//  AppDelegate.m
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "BlogViewController.h"
#import "TwitterWebViewController.h"
#import "TwitterTableViewController.h"
#import "InfoTableViewController.h"
#import "MusicTableViewController.h"
#import "MovieTableViewController.h"
#import "PhotoViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    BlogViewController *blogController = [[BlogViewController alloc] init];
    PhotoViewController *photoController = [[PhotoViewController alloc] init];
    TwitterWebViewController *twitterWebController = [[TwitterWebViewController alloc] init];
    TwitterTableViewController *twitterTable = [[TwitterTableViewController alloc] initWithStyle:UITableViewStylePlain];
    InfoTableViewController *infoTable = [[InfoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    MusicTableViewController *musicTable = [[MusicTableViewController alloc] initWithStyle:UITableViewStylePlain];
    MovieTableViewController *movieTable = [[MovieTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *twitter = [[UINavigationController alloc] initWithRootViewController:twitterTable];
    UINavigationController *info = [[UINavigationController alloc] initWithRootViewController:infoTable];
    UINavigationController *music = [[UINavigationController alloc] initWithRootViewController:musicTable];
    UINavigationController *movie = [[UINavigationController alloc] initWithRootViewController:movieTable];
    UINavigationController *photo = [[UINavigationController alloc] initWithRootViewController:photoController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, info, blogController, music, twitter, twitterWebController, photo, movie, nil];
    //self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, blogController, twitterWebController, movie, nil];
    self.window.rootViewController = self.tabBarController;

    [self.window makeKeyAndVisible];
    
    // 　tabbarのeditボタン非表示
    self.tabBarController.customizableViewControllers=nil;
    //self.tabBarController.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.tabBarController.moreNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    
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

// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    [tabBarController.moreNavigationController popViewControllerAnimated:NO];

    // navigationBarのクラスはrootViewに戻したい
    for (id obj in tabBarController.viewControllers) {
        if ([obj isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = obj;
            [nav popViewControllerAnimated:NO];
            //NSLog(@"3333333");
        }
        //NSLog(@"%@", obj);
    }
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
