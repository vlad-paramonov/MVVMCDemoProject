//
//  ItemList+Infrastructure.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 26.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxRelay

protocol ItemListModuleProtocol {
    var moduleInput: ItemListViewModel.ModuleInput { get }
    var moduleOutput: ItemListViewModel.ModuleOutput { get }
}

extension ItemListViewModel {
    
    struct ModuleInput { }
    
    struct ModuleOutput {
        let item = PublishRelay<FruitModel>()
    }

}
