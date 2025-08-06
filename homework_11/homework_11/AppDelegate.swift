//
//  AppDelegate.swift
//  homework_11
//
//  Created by Vadzim Pappkou on 05.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow (frame: UIScreen.main.bounds)
        let mainVC = ViewController()
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        return true
    }


   

}

