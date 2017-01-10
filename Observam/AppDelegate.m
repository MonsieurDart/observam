//
//  AppDelegate.m
//  Observam
//
//  Created by Mathieu Godart on 11/04/2016.
//  Copyright © 2016 Godart. All rights reserved.
//

#import "AppDelegate.h"

@interface AppD ()

@end

@implementation AppD



+ (AppD *)me { return UIApplication.sharedApplication.delegate; }

+ (UIColor *)globalTintColor { return [UIColor colorWithRed:31./255 green:187./255 blue:151./255 alpha:1]; }



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[UITabBar appearance] setTintColor:[AppD globalTintColor]];

    [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil]];
//    application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil))

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
////    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:60*60*24];
//    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:3];
//    notification.alertBody = @"24 hours passed since last visit :(";
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self scheduleNotification];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self scheduleNotification];
}

- (void)scheduleNotification
{
    UILocalNotification *locNot = [[UILocalNotification alloc] init];
    locNot.fireDate             = [NSDate dateWithTimeIntervalSinceNow:2.5];
    locNot.alertBody            = @"Avez-vous pensé à prendre votre traitement ce matin ?";
    [[UIApplication sharedApplication] scheduleLocalNotification: locNot];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

//- (void)applicationWillTerminate:(UIApplication *)application {
//    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//}

@end
