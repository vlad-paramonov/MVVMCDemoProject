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
        let module = ItemListConfigurator.configure()
        // coordinator should communicate with module via viewModel I/O
        module.viewModel.moduleOutput.item.subscribe(onNext: { [weak self] model in
            self?.presentDetail(model)
        }).disposed(by: bag)
        set([module.viewController])
    }
    
    func presentDetail(_ model: FruitModel) {
        let config = ItemDetailConfigurator.configure()
        let vc = config.viewController
        push(vc)
    }
    
}
