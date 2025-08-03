//
//  AppDelegate.swift
//  homework_10
//
//  Created by Vadzim Pappkou on 02.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
     window = UIWindow (frame: UIScreen.main.bounds)
        
        let mainVC = FirstViewController ()
        let secondVC = SecondViewController ()
        let thirdVC = ThirdViewController ()
        let fourVC = FourViewController ()
        let fiveVC = FiveViewController ()
        
        let mainNC = UINavigationController(rootViewController: mainVC)
        let secondNC = UINavigationController(rootViewController: secondVC)
        let thirdNC = UINavigationController(rootViewController: thirdVC)
        let fourNC = UINavigationController(rootViewController: fourVC)
        let fiveNC = UINavigationController(rootViewController: fiveVC)
        
        
        mainNC.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "pencil"), tag: 0)
        secondNC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "eraser"), tag: 1)
        thirdNC.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "trash"), tag: 2)
        fourNC.tabBarItem = UITabBarItem(title: "Four", image: UIImage(systemName: "folder"), tag: 3)
        fiveNC.tabBarItem = UITabBarItem(title: "Five", image: UIImage(systemName: "paperplane"), tag: 4)
        
        let uiTabVC = UITabBarController ()
        uiTabVC.viewControllers = [mainNC,secondNC,thirdNC,fourNC,fiveNC]
        window?.rootViewController = uiTabVC
        window?.makeKeyAndVisible()
        
        return true
    }




}

