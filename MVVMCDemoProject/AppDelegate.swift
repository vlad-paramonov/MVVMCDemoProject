//
//  AppDelegate.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//

import UIKit
import IOSCoordinator

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppWindowCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        coordinator = AppWindowCoordinator(container: window!)
        coordinator.start()
        return true
    }

}

