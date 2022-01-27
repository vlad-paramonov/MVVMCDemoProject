//
//  ItemView.swift
//  MVVMCDemoProject
//
//  Created by Vlad Paramonov on 27.01.2022.
//

import UIKit
import RxSwift
import RXDataSourceConfigurator

class ItemView: UIView {

    struct Model {
        let id: String
        let name: String
    }

    var model: Model?
    
}

extension ItemView.Model: DiffIdentifiable {
    
    var diffIdentifier: String {
        "\(id)"
    }
    
}
