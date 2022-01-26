//
//  MainCoordinator.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//

import UIKit
import IOSCoordinator
import RxSwift

class MainCoordinator: NavigationCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        presentContent()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
}

private extension MainCoordinator {
    
    func presentContent() {
        
    }
    
}
