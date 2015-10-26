//
//  AppDelegate.swift
//  CloudMITest
//
//  Created by mozf on 15/10/21.
//  Copyright © 2015年 mozi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?

    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        let userInfo = RCUserInfo()
        
        userInfo.userId = userId
        
        switch userId {
        case "mozf":
            userInfo.name = "mozifeng"
            userInfo.portraitUri = "http://tp1.sinaimg.cn/1800102740/180/40016213895/1.jpg"
        case "mandy_014":
            userInfo.name = "mandy"
            userInfo.portraitUri = "http://tp2.sinaimg.cn/1075376185/180/5674894113/0.jpg"
        default:
            print("没有此用户")
        }
        return completion(userInfo)
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        RCIM.sharedRCIM().initWithAppKey("sfci50a7cbixi")
        
        RCIM.sharedRCIM().userInfoDataSource = self
        
        RCIM.sharedRCIM().connectWithToken("adVz6BeJIW5xN16AAjdmwg+a5Fv9HjHfnZ42j6obF8w3klyedFpzcu+z5XLpcw3ByONa7PhZw57FvwsfejPgsw==", success: { (_) -> Void in
            
            print("connect successed")
            
            let currentUser = RCUserInfo(userId: "mozf", name: "mozifeng", portrait: "http://tp1.sinaimg.cn/1800102740/180/40016213895/1.jpg")
            
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            }, error: { (_) -> Void in
                
                print("connect error")
            }) { () -> Void in
                
                print("incorrect token")
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

