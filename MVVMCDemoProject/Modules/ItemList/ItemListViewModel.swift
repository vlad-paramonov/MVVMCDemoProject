//
//  ItemListViewModel.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ItemListViewModelProtocol {
    var bindings: ItemListViewModel.Bindings { get }
    var commands: ItemListViewModel.Commands { get }
}

extension ItemListViewModel {
    
    struct Dependencies { }
    
    struct Bindings {
        let networkActivity = BehaviorRelay<Bool>(value: false)
        let error = BehaviorRelay<Error?>(value: nil)
    }
    
    struct Commands { }
}

class ItemListViewModel: ItemListModuleProtocol, ItemListViewModelProtocol {
    
    let moduleInput: ModuleInput
    let moduleOutput = ModuleOutput()
    
    let bindings = Bindings()
    let commands = Commands()
    
    private let dp: Dependencies
    private let bag = DisposeBag()
    
    init(dependencies: Dependencies, moduleInput: ModuleInput) {
        self.dp = dependencies
        self.moduleInput = moduleInput
        configure(moduleInput: moduleInput)
        configure(commands: commands)
    }

    deinit {
        print("💀" + "\(type(of: self)) " + "dead")
    }

}

private extension ItemListViewModel {
    
    func configure(moduleInput: ModuleInput) {
        
    }
    
    func configure(commands: Commands) {
        
    }

}
