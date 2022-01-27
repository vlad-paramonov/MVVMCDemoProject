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
    
    struct Output {}
    
    private let bag = DisposeBag()
    
    override func start() {
        presentContent()
    }
    
    deinit { print("💀" + "\(type(of: self)) " + "dead") }
}

private extension MainCoordinator {
    
    func presentContent() {
        let config = ItemListConfigurator.configure()
        let vc = config.viewController
        // subscribe tap on cell to opening presentDetail() ???
        set([vc])
    }
    
    func presentDetail() {
        let config = ItemDetailConfigurator.configure()
        let vc = config.viewController
        push(vc)
    }
    
}
