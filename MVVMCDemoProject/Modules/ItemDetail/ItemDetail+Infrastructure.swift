//
//  ItemDetail+Infrastructure.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import RxRelay

protocol ItemDetailModuleProtocol {
    var moduleInput: ItemDetailViewModel.ModuleInput { get }
    var moduleOutput: ItemDetailViewModel.ModuleOutput { get }
}

extension ItemDetailViewModel {
    
    struct ModuleInput { }
    
    struct ModuleOutput { }

}
