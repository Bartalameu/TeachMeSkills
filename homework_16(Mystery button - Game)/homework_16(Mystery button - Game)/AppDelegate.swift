//
//  AppDelegate.swift
//  homework_16(Mystery button - Game)
//
//  Created by Vadzim Pappkou on 21.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController ()
        window?.makeKeyAndVisible()
        return true
    }
}

