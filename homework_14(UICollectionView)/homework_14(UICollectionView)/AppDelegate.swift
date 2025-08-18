//
//  AppDelegate.swift
//  homework_14(UICollectionView)
//
//  Created by Vadzim Pappkou on 17.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let startVC = UINavigationController(rootViewController: CollectionViewController())
        window?.rootViewController = startVC
        window?.makeKeyAndVisible()
        return true
    }


}

