//
//  AppDelegate.swift
//  Finder
//
//  Created by Tyler Holloway on 7/11/17.
//  Copyright © 2017 Finder. All rights reserved.
//

import UIKit
<<<<<<< HEAD
import Firebase
import FoodFactsSDK
=======
//import Firebase
>>>>>>> origin/master
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Facebook Login
        //        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        //
        
<<<<<<< HEAD
        //        // Use Firebase library to configure APIs
        //        FirebaseApp.configure()
=======
//        // Use Firebase library to configure APIs
//        FirebaseApp.configure()
>>>>>>> origin/master
        
        //Initialize Parse
        Parse.initialize(with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
            configuration.applicationId = "Finder"
            configuration.clientKey = "whatcannotbetouched"
            configuration.server = "https://frozen-fjord-66198.herokuapp.com/parse"
        }))
        
        //user persist - check if current user is logged in
        if let currentUser = PFUser.current(){
            print("Welcome back to Finder, \(currentUser.username!) 😀")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeController = storyboard.instantiateViewController(withIdentifier: "Home")
            window?.rootViewController = homeController
            
        }
        
        //change color of tab bar
        UITabBar.appearance().barTintColor = UIColor.black
        
        // Change color of navigation bar
        UINavigationBar.appearance().barTintColor = UIColor.black
        
        //Change the navigation bar color
        UINavigationBar.appearance().tintColor = UIColor.white
        
        // Change color of navigation bar text color
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        
        return true
    }
    
    // [START new_delegate]
    //    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
    //        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
    //    }
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}
