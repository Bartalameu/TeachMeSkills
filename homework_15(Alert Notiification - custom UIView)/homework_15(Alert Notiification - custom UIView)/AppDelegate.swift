//
//  AppDelegate.swift
//  lesson_15(Alert Notiification - custom UIView)
//
//  Created by Vadzim Pappkou on 19.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let startVC = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = startVC
        window?.makeKeyAndVisible()
        
        return true
    }

   


}

