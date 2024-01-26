//
//  AppDelegate.swift
//  GameProject
//
//  Created by Ира on 15.01.2024.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()

        FirebaseManager.shared.getSettings { isOn in
            if isOn {
                self.window?.rootViewController = CustomWebViewController()
            } else {
                self.window?.rootViewController = UINavigationController(rootViewController: MenuAssembly().assemble())
            }
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
}

