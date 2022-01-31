//
//  ItemDetailViewModel.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ItemDetailViewModelProtocol {
    var bindings: ItemDetailViewModel.Bindings { get }
    var commands: ItemDetailViewModel.Commands { get }
}

extension ItemDetailViewModel {
    
    struct Dependencies { }
    
    struct Bindings {
        let networkActivity = BehaviorRelay<Bool>(value: false)
        let error = BehaviorRelay<Error?>(value: nil)
        let fruitId = BehaviorRelay<FruitModel.Id?>(value: nil)
        let fruitEmoji = BehaviorRelay<String?>(value: nil)
    }
    
    struct Commands { }
}

class ItemDetailViewModel: ItemDetailModuleProtocol, ItemDetailViewModelProtocol {
    
    let moduleInput: ModuleInput
    let moduleOutput = ModuleOutput()
    
    let bindings = Bindings()
    let commands = Commands()
    
    private let dp: Dependencies
    private let bag = DisposeBag()
    
    private let fruit = BehaviorRelay<FruitModel?>(value: nil)
    
    init(dependencies: Dependencies, moduleInput: ModuleInput) {
        self.dp = dependencies
        self.moduleInput = moduleInput
        configure(moduleInput: moduleInput)
        configure(commands: commands)
        configure()
    }

    deinit {
        print("💀" + "\(type(of: self)) " + "dead")
    }

}

private extension ItemDetailViewModel {
    
    func configure(moduleInput: ModuleInput) {
        moduleInput.fruit.bind(to: fruit).disposed(by: bag)
    }
    
    func configure(commands: Commands) {
        
    }
    
    func configure() {
        fruit.filterNil().subscribe(onNext: { [weak self] fruit in
            self?.parseFruit(fruit)
        }).disposed(by: bag)
        
//        alt
//        fruit.map { $0.id }.bind(to: bindings.fruitId).disposed(by: bag)
    }
    
    func parseFruit(_ fruit: FruitModel) {
        bindings.fruitId.accept(fruit.id)
        bindings.fruitEmoji.accept(fruit.name)
    }

}
