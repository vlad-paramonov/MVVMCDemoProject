//
//  ItemDetailConfigurator.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class ItemDetailConfigurator {
    
    typealias Module = (
        viewController: UIViewController,
        viewModel: ItemDetailModuleProtocol
    )
    
    class func configure() -> Module {
        let viewController = createViewController()
        let dependencies = createDependencies()
        let viewModel = ItemDetailViewModel(
            dependencies: dependencies,
            moduleInput: .init()
        )
        viewController.viewModel = viewModel
        return (viewController, viewModel)
    }
    
    private class func createViewController() -> ItemDetailViewController {
        return ItemDetailViewController()
    }
    
    private class func createDependencies() -> ItemDetailViewModel.Dependencies {
        let dependencies = ItemDetailViewModel.Dependencies()
        return dependencies
    }
    
}
