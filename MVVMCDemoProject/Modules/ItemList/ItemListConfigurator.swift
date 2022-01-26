//
//  ItemListConfigurator.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class ItemListConfigurator {
    
    typealias Module = (
        viewController: UIViewController,
        viewModel: ItemListModuleProtocol
    )
    
    class func configure() -> Module {
        let viewController = createViewController()
        let dependencies = createDependencies()
        let viewModel = ItemListViewModel(
            dependencies: dependencies,
            moduleInput: .init()
        )
        viewController.viewModel = viewModel
        return (viewController, viewModel)
    }
    
    private class func createViewController() -> ItemListViewController {
        return ItemListViewController()
    }
    
    private class func createDependencies() -> ItemListViewModel.Dependencies {
        let dependencies = ItemListViewModel.Dependencies()
        return dependencies
    }
    
}
