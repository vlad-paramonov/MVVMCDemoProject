//
//  ItemListViewModel.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxSwift
import RxCocoa
import RXDataSourceConfigurator

struct FruitModel {
    typealias Id = String
    let id: String
    let name: String
}

protocol ItemListViewModelProtocol {
    var bindings: ItemListViewModel.Bindings { get }
    var commands: ItemListViewModel.Commands { get }
}

extension ItemListViewModel {
    
    struct Dependencies { }
    
    struct Bindings {
        let networkActivity = BehaviorRelay<Bool>(value: false)
        let error = BehaviorRelay<Error?>(value: nil)
        let cellModels = BehaviorRelay<[BaseCellModel]?>(value: nil)
        let fruit = BehaviorRelay<FruitModel?>(value: nil)
    }
    
    struct Commands {
        let find = PublishRelay<FruitModel.Id>()
    }
}

class ItemListViewModel: ItemListModuleProtocol, ItemListViewModelProtocol {
    
    let moduleInput: ModuleInput
    let moduleOutput = ModuleOutput()
    
    let bindings = Bindings()
    let commands = Commands()
    
    private let dp: Dependencies
    private let bag = DisposeBag()
    
    private let items = BehaviorRelay<[FruitModel]?>(value: nil)
    
    private let itemsCells = PublishRelay<[BaseCellModel]>()
    
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

private extension ItemListViewModel {
    
    func configure(moduleInput: ModuleInput) {
        
    }
    
    func configure(commands: Commands) {
        commands.find.bind(to: fruitModelForId()).disposed(by: bag)
    }
    
    func configure() {
//        bindings.fruit.subscribe { fruit in
//            print("fruit:", fruit)
//        }.disposed(by: bag)
        
        items.filterNil().bind(to: parseItems()).disposed(by: bag)
        itemsCells.bind(to: bindings.cellModels).disposed(by: bag)
        
        fetchItems()
    }

}

private extension ItemListViewModel {
    
    func fetchItems() {
        // simulating data fetching saved using custom model
        // the model that will later be translated to a different one to fill the cells
        let models = ["🍏", "🍌", "🥑", "🍍", "🍊"].map { fruit -> FruitModel in
                .init(id: UUID().uuidString, name: fruit)
        }
        // using accept method to insert data into BehaviorRelay
        self.items.accept(models)
    }
    
    func parseItems() -> Binder<[FruitModel]> {
        // initializing binder with self as target
        // weak ref is handled in Binder
        return .init(self) { target, items in
            let cellModels = items.enumerated().map { index, item -> BaseCellModel in
                let itemVM = ItemView.Model(id: item.id, name: item.name)  // has to be DiffIdentifiable
                let cellVM = ContainerCellModel<ItemView>(id: item.id, model: itemVM)
                return cellVM
            }
            target.itemsCells.accept(cellModels)
        }
    }
    
    func fruitModelForId() -> Binder<FruitModel.Id> {
        return .init(self) { target, id in
            guard let items = target.items.value,
                  let item = items.first(where: { $0.id == id })
            else {
                print("oops")
                return
            }
            target.bindings.fruit.accept(item)
        }
    }
    
}
