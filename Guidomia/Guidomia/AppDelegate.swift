//
//  AppDelegate.swift
//  Guidomia
//
//  Created by Archit Patel on 2022-04-04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController()
        let mainView = CarSummaryViewController(nibName: nil, bundle: nil)
        nav.viewControllers = [mainView]
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = nav
        
        UINavigationBar.appearance().barTintColor =  UIColor(named: "carOrangeColor")
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        return true
    }
}

