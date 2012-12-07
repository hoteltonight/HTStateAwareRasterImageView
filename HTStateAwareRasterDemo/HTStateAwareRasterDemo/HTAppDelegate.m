//
//  HTAppDelegate.m
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/6/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import "HTAppDelegate.h"
#import "HTExampleTableViewController.h"
#import "HTGeneratedImagesViewController.h"

@interface HTAppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) HTExampleTableViewController *exampleTableViewController;
@property (nonatomic, strong) HTGeneratedImagesViewController *generatedImagesViewController;

@end

@implementation HTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.exampleTableViewController = [[HTExampleTableViewController alloc] init];
    self.generatedImagesViewController = [[HTGeneratedImagesViewController alloc] init];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[self.exampleTableViewController, self.generatedImagesViewController];
    self.tabBarController.view.backgroundColor = [UIColor blackColor];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
