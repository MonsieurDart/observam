//
//  AppD.swift
//  T
//
//  Created by Mathieu Godart on 14/01/2017.
//  Copyright © 2017 Godart. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppD: UIResponder, UIApplicationDelegate {

    var window: UIWindow?



    class func me() -> AppD {
        return UIApplication.shared.delegate as! AppD
    }



    class func globalTintColor() -> UIColor {
        return UIColor(red:31.0/255, green:187.0/255, blue:151.0/255, alpha:1)
    }
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UITabBar.appearance().tintColor = AppD.globalTintColor()

        application.registerUserNotificationSettings(UIUserNotificationSettings(types: .alert, categories: nil))

//        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil]];

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        scheduleNotification()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        scheduleNotification()
    }

    func scheduleNotification() {
//        let locNot = [[UILocalNotification alloc] init];
//        locNot.fireDate             = [NSDate dateWithTimeIntervalSinceNow:2.5];
//        locNot.alertBody            = @"Avez-vous pensé à prendre votre traitement ce matin ?";
//        [[UIApplication sharedApplication] scheduleLocalNotification: locNot];
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        UIApplication.shared.cancelAllLocalNotifications()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

