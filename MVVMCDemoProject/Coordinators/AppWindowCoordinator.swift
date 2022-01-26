//
//  AppWindowCoordinator.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//

import UIKit
import IOSCoordinator

class AppWindowCoordinator: WindowCoordinator {
    
    override func start() {
        configure()
    }
    
    private func configure() {
        presentApp()
    }
    
    private func presentApp() {
        let container = UINavigationController()
        let coord = MainCoordinator(container: container)
        setRoot(viewControler: container)
        coord.start()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
    
}
